//
//  CHGCDViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/13.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//
/**
 GCD之前先来了解多线程中的一些概念：
 1、任务：需要执行的操作，程序中每一个需要线程执行的操作都是一个任务。
 在多线程开发中对执行任务有两种方式：同步执行和异步执行，同步和异步的区别在于是否等待队列中的任务执行完毕和是否开辟新的线程

 同步执行（sync）
 同步添加任务到指定队列，在添加任务执行结束之前，一直等待，直到队列中的任务执行完成再继续执行。
 不开辟新的线程。

 异步执行（async）
 异步添加任务到指定队列中，不会出现等待，会继续执行。
 开辟新的线程。
 ————————————————

 
 队列（dispatch Queue）
 队列是用来放置任务的，队列是一种特殊的线性表，采用FIFO（先进先出）的原则，及任务添加到队列是从队列尾部添加，而读取任务执行是从队列的头部开始读取。例如排队去食堂打饭，新来的人要排在队尾，先排队的先打饭。

 GCD中有两种队列：串行队列和并发队列。
 两种队列都是采用FIFO的原则，区别在于执行顺序不同和开辟线程数不同。

 串行队列（Serial Dispatch Queue）
 每次只有一个任务被执行，当被执行的任务执行完毕在执行下一个任务。队列中只有一个线程。

 并发队列（Concurrent Dispatch Queue）
 可以让多个任务同时执行，可以开辟多个线程来执行任务。
 ————————————————

 */
#import "CHGCDViewController.h"
#import <pthread.h>
@interface CHGCDViewController ()
@property(nonatomic,assign)int   ticketSurplusCount ;
@end

@implementation CHGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   
}

-(void)testcompletionHandler:(void (^)(id responseBody))sucessHandler{
        [NSThread sleepForTimeInterval:3];
       NSLog(@"进来了");
        dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_CONCURRENT);
         
         dispatch_async(queue, ^{
             // 追加任务 1
             [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
              if (sucessHandler) {
                   sucessHandler(@"ddd");
               }
         });
  
 
}

//同步执行 + 串行队列
//在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务。
- (IBAction)btn1:(UIButton *)sender {
    
            NSLog(@"1---%@",[NSThread currentThread]);
            dispatch_queue_t queue =  dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
            dispatch_sync(queue, ^{
                [NSThread sleepForTimeInterval:2];// 模拟耗时操作
                [self testcompletionHandler:^(id responseBody) {
                    [NSThread sleepForTimeInterval:2];
                    NSLog(@"回调");
                }];
                
                NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
            });
            
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
            
            dispatch_sync(queue, ^{
                
                
                NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
            });
            
            NSLog(@"5---%@",[NSThread currentThread]);
}
/**
* 同步执行 + 并发队列
 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一* 个任务。
*
*/
- (IBAction)btn2:(UIButton *)sender {
    
            NSLog(@"1---%@",[NSThread currentThread]);
            dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
            dispatch_sync(queue, ^{
                // 追加任务 1
                [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
                NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
            });
            
            NSLog(@"3---%@",[NSThread currentThread]);
            dispatch_sync(queue, ^{
                // 追加任务 1
                
                NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
            });
            NSLog(@"----end----");
    
  
}

/**
* 异步执行 + 串行队列
* 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务(但对列外一部执行)。
*/
- (IBAction)btn3:(UIButton *)sender {
    
        dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);

        dispatch_async(queue, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        NSLog(@"2---%@",[NSThread currentThread]);
        dispatch_async(queue, ^{
            // 追加任务 2
            
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });

        NSLog(@"-----end----");
     
}

/**
* 异步执行 + 并发队列
* 特点：可以开启多个线程，任务交替（同时）执行。
*/
- (IBAction)btn4:(UIButton *)sender {
    
        dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
        
        dispatch_async(queue, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        NSLog(@"2---%@",[NSThread currentThread]);
        dispatch_async(queue, ^{
            // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        NSLog(@"----end------");
        
       
}

/**
* 同步执行 + 主队列
* 特点(主线程调用)：互等卡主不执行。
* 特点(其他线程调用)：不会开启新线程，执行完一个任务，再执行下一个任务。
 
 这是因为我们在主线程中执行 btn5 方法，相当于把 btn5 任务放到了主线程的队列中。而 同步执行 会等待当前队列中的任务执行完毕，才会接着执行。那么当我们把 任务 1 追加到主队列中，任务 1 就在等待主线程处理完 btn5 任务。而btn5 任务需要等待 任务 1 执行完毕，才能接着执行。

 那么，现在的情况就是 syncMain 任务和 任务 1 都在等对方执行完毕。这样大家互相等待，所以就卡住了，所以我们的任务执行不了，而且 btn5---end 也没有打印。

*/
- (IBAction)btn5:(UIButton *)sender {
    
        dispatch_queue_t queue = dispatch_get_main_queue();
        
        dispatch_sync(queue, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        NSLog(@"2---%@",[NSThread currentThread]);
        dispatch_sync(queue, ^{
            // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        NSLog(@"------end--");
}

/**
* 异步执行 + 主队列
* 特点：只在主线程中执行任务，执行完一个任务，再执行下一个任务
*/
- (IBAction)btn6:(UIButton *)sender {
    
        dispatch_queue_t queue = dispatch_get_main_queue();
        
        dispatch_async(queue, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        NSLog(@"2---%@",[NSThread currentThread]);
        dispatch_async(queue, ^{
            // 追加任务 2
            // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        NSLog(@"------end--");
       
}
/*
 dispatch_get_global_queue
 全局并发队列的获取方法
 */
 
- (IBAction)btn7:(UIButton *)sender {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    

    dispatch_async(queue, ^{
        NSLog(@"11111-----%@",[NSThread currentThread]);
          [NSThread sleepForTimeInterval:2];
           
        NSLog(@"11111结束");
    
    });
    dispatch_async(queue, ^{
        NSLog(@"2222-----%@",[NSThread currentThread]);
          [NSThread sleepForTimeInterval:2];
        NSLog(@"22222结束");
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"同步进来了");
        NSLog(@"同步-----%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
        NSLog(@"同步结速");
   
    });
      NSLog(@"-----end-----");
}
/**
 dispatch_barrier_async
 我们有时需要异步执行两组操作，而且第一组操作执行完之后，才能开始执行第二组操作。这样我们就需要一个相当于
 */
- (IBAction)btn8:(UIButton *)sender {
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"外1");
    dispatch_barrier_async(queue, ^{
        // 追加任务 barrier
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
    });
    
    NSLog(@"外2");
    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务 4
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
    });
    NSLog(@"dddd");
    
}
/**
 一次性代码（只执行一次）：dispatch_once
 */
- (IBAction)btn9:(UIButton *)sender {
    static dispatch_once_t onceToken;
       dispatch_once(&onceToken, ^{
           
         NSLog(@"z执行一次---%@",[NSThread currentThread]);
           // 只执行 1 次的代码（这里面默认是线程安全的）
       });
}
/**
 GCD 快速迭代方法：dispatch_apply
 */

- (IBAction)btn10:(UIButton *)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
      
      NSLog(@"apply---begin");
      dispatch_apply(6, queue, ^(size_t index) {
          NSLog(@"%zd---%@",index, [NSThread currentThread]);
      });
      NSLog(@"apply---end");
}
/**
 dispatch_group
 有时候我们会有这样的需求：分别异步执行2个耗时任务，然后当2个耗时任务都执行完毕后再回到主线程执行任务。这时候我们可以用到 GCD 的队列组。
 */
- (IBAction)btn11:(UIButton *)sender {
    
    
       dispatch_group_t group =  dispatch_group_create();
       
       dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           // 追加任务 1
           [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
           NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
       });
       
       dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           // 追加任务 2
           [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
           NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
       });
           NSLog(@"外1---%@",[NSThread currentThread]);
       dispatch_group_notify(group, dispatch_get_main_queue(), ^{
           // 等前面的异步任务 1、任务 2 都执行完毕后，回到主线程执行下边任务
           [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
           NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程

           NSLog(@"group---end");
       });
    
      NSLog(@"外2---%@",[NSThread currentThread]);
}

/**
 dispatch_group_wait
 
 暂停当前线程（阻塞当前线程），等待指定的 group 中的任务执行完成后，才会往下继续执行。
 */
- (IBAction)btn12:(UIButton *)sender {
    
       
       dispatch_group_t group =  dispatch_group_create();
       
       dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           // 追加任务 1
           [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
           NSLog(@"1---%@",[NSThread currentThread]);// 打印当前线程
           
           [self testcompletionHandler:^(id responseBody) {
                  [NSThread sleepForTimeInterval:2];
               NSLog(@"回调");
           }];
       });
       
       dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           // 追加任务 2
           [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
           NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
       });
       
      NSLog(@"group---3");
       // 等待上面的任务全部完成后，会往下继续执行（会阻塞当前线程）
       dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
       
       NSLog(@"group---end");
    
}
/**
 dispatch_group_enter、dispatch_group_leave
 dispatch_group_enter 标志着一个任务追加到 group，执行一次，相当于 group 中未执行完毕任务数 +1
 dispatch_group_leave 标志着一个任务离开了 group，执行一次，相当于 group 中未执行完毕任务数 -1。
 当 group 中未执行完毕任务数为0的时候，才会使 dispatch_group_wait 解除阻塞，以及执行追加到 dispatch_group_notify 中的任务。

 */
- (IBAction)btn13:(id)sender {
    dispatch_group_t group = dispatch_group_create();
      dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
      dispatch_group_enter(group);
      dispatch_async(queue, ^{
          // 追加任务 1
          
          [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
          NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程

          [self testcompletionHandler:^(id responseBody) {
                [NSThread sleepForTimeInterval:5];
              NSLog(@"回调");
                  dispatch_group_leave(group);
          }];
      
      });
      
      dispatch_group_enter(group);
      dispatch_async(queue, ^{
          // 追加任务 2
          [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
          NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
          
          dispatch_group_leave(group);
      });
      
      dispatch_group_notify(group, dispatch_get_main_queue(), ^{
          // 等前面的异步操作都执行完毕后，回到主线程.
          [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
          NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
      
          NSLog(@"group---end");
      });
    
    NSLog(@"ddddddd");
}
/**
 Dispatch Semaphore 线程同步
 信号量是基于计数器的一种多线程同步机制，用来管理对资源的并发访问。
 信号量就是一种可用来控制访问资源的数量的标识，设定了一个信号量，在线程访问之前，加上信号量的处理，则可告知系统按照我们指定的信号量数量来执行多个线程。
 其实，这有点类似锁机制了，只不过信号量都是系统帮助我们处理了，我们只需要在执行线程之前，设定一个信号量值，并且在使用时，加上信号量处理方法就行了。
 简单来讲 信号量为0则阻塞线程，大于0则不会阻塞。则我们通过改变信号量的值，来控制是否阻塞线程，从而达到线程同步。
 */
- (IBAction)btn14:(id)sender {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    创建信号量，参数：信号量的初值，如果小于0则会返回NULL
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    __block int number = 0;
    
    NSLog(@"semaphore---start%@,number = %d",semaphore,number);
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
    
        number = 100;
        //提高信号量， 使信号量加1并返回
        dispatch_semaphore_signal(semaphore);
    });
     
    NSLog(@"semaphore---中%@,number = %d",semaphore,number);
    
    // 等待降低信号量，接收一个信号和时间值(多为DISPATCH_TIME_FOREVER)
    // 若信号的信号量为0，则会阻塞当前线程，直到信号量大于0或者经过输入的时间值；
    // 若信号量大于0，则会使信号量减1并返回，程序继续住下执行
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore---end%@,number = %d",semaphore,number);
}
/**
 Dispatch Semaphore 线程安全和线程同步（为线程加锁）
 */
- (IBAction)btn15:(id)sender {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
       NSLog(@"semaphore---begin");
       
//       semaphoreLock = dispatch_semaphore_create(1);
          dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
       self.ticketSurplusCount = 50;
       
       // queue1 代表北京火车票售卖窗口
       dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
       // queue2 代表上海火车票售卖窗口
       dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
       
    
   
    

       __weak typeof(self) weakSelf = self;
       dispatch_async(queue1, ^{
           [weakSelf saleTicketSafe:semaphore ticketSurplusCount:self.ticketSurplusCount name:@"窗口001"] ;
       });
       
       dispatch_async(queue2, ^{
           [weakSelf saleTicketSafe:semaphore ticketSurplusCount:self.ticketSurplusCount name:@"窗口002"];
       });
}

/**
 * 售卖火车票（线程安全）
 */
- (void)saleTicketSafe:(dispatch_semaphore_t )semaphoreLock ticketSurplusCount:(int)ticketSurplusCount name:(NSString *)name {
    while (1) {
        // 相当于加锁
        dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
        
        if (  self.ticketSurplusCount > 0) {  // 如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog( @"剩余票数：%d 线程：%@，窗口==%@", self.ticketSurplusCount, [NSThread currentThread],name);
            [NSThread sleepForTimeInterval:0.2];
        } else { // 如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            
            // 相当于解锁
            dispatch_semaphore_signal(semaphoreLock);
            break;
        }
        
        // 相当于解锁
        dispatch_semaphore_signal(semaphoreLock);
    }
}

/**
 同步：同步函数不具备开启线程的能力，无论是什么队列都不会开启线程；

 异步：异步函数具备开启线程的能力，开启几条线程由队列决定（串行队列只会开启一条新的线程，并发队列会开启多条线程）
 
 阻塞：指一个正在执行的任务未能完成或耗时过长，抢占资源，导致后续任务无法处理；在实现登录操作中，需要使用阻塞处理；但在数据解析、加载或后台任务处理时，我们需要避免阻塞
 */
- (IBAction)threadBlockgameTest:(id)sender {
    
   
    dispatch_queue_t queue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"dddddddd");
    });
    NSLog(@"12345");
}

//死锁
- (IBAction)threadDead:(id)sender {
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"ddddd");
    });
    NSLog(@"1235");
}

/**
 互斥锁 @synchronized NSLock pthread
 */
- (IBAction)lockbtn:(id)sender {
    
    NSLock * lock = [[NSLock alloc]init];
    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue1, ^{
        
        NSLog(@"进入线程1");
        [lock lock];
        NSLog(@"线程1开始");
        sleep(5);
        NSLog(@"线程1结束");
        [lock unlock];
    });
    
    dispatch_async(queue1, ^{
        NSLog(@"进入线程2");

        [lock lock];
        NSLog(@"线程2开始");
   
        sleep(2);
        NSLog(@"线程2结束");
        [lock unlock];
        
    });
    
    NSLog(@"进来了----");
}
- (IBAction)synchronizedBtn:(id)sender {
    
    NSObject *other = [[NSObject alloc] init];
        //线程1
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"进入线程1");
            @synchronized(self){
                NSLog(@"线程1开始");
                sleep(10);
                NSLog(@"线程1结束");
            }
        });
        //线程2
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"进入线程2");
            @synchronized(other){
                NSLog(@"线程2开始");
                sleep(3);
                NSLog(@"线程2结束");
            }
        });
        //线程3
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"进入线程3");
            @synchronized(self){
                NSLog(@"线程3开始");
                sleep(2);
                NSLog(@"线程3结束");
            }
        });
}

//pthread除了创建互斥锁，还可以创建递归锁、读写锁、once等锁。稍后会介绍一下如何使用。如果想要深入学习pthread请查阅相关文档、资料单独学习。
- (IBAction)pthreadHuchiBtn:(id)sender {
    
 
}



- (IBAction)diguiLock:(id)sender {
    
  

}
- (IBAction)testasynic:(id)sender {
    
    for (int i = 0; i<5; i++) {
        NSLog(@"开始");
        NSString * strname = [NSString stringWithFormat:@"初始化%d",i];
        [self testaysnc:strname];
    }
    NSLog(@"借宿了----");
}



-(NSString *)testaysnc:(NSString *)name2{
   __block NSString * name;
    
    dispatch_group_t group =  dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        name = @"1234";
        [NSThread sleepForTimeInterval:2];
        NSLog(@"---中%@",name2);
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"-----结束-%@",name2);

    return  name;
       
}

- (IBAction)testsync:(id)sender {
    
    
    NSLog(@"开始了-------");
    NSString * name =   [self syncRuturnStr:@"测试2"];
    
    NSLog(@"---%@",name);
  
}

-(NSString *)syncRuturnStr:(NSString *)name{
   __block NSString * name3  =nil;
    dispatch_queue_t queue = dispatch_queue_create("com.scca.dddfd", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"线程1开始");
        NSLog(@"%@----",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"线程1结束");
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"线程2开始");
        [NSThread sleepForTimeInterval:3];
        NSLog(@"线程2结束");
        name3 = @"藏三";
    });
    
    NSLog(@"-------end---");
    return name3;
    
}


@end
