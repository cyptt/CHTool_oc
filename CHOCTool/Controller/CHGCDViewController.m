//
//  CHGCDViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/13.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHGCDViewController.h"

@interface CHGCDViewController ()

@end

@implementation CHGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   
}

//同步执行 + 串行队列
//在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务。
- (IBAction)btn1:(UIButton *)sender {
    
    NSLog(@"1---%@",[NSThread currentThread]);
    dispatch_queue_t queue =  dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
       dispatch_sync(queue, ^{
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
           
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
       });
       
       NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
       
       dispatch_sync(queue, ^{
       
             
              NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
         });
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
       
}

/**
* 同步执行 + 主队列
* 特点(主线程调用)：互等卡主不执行。
* 特点(其他线程调用)：不会开启新线程，执行完一个任务，再执行下一个任务。
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
       
}
/*
 dispatch_get_global_queue
 全局并发队列的获取方法
 */
 
- (IBAction)btn7:(UIButton *)sender {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
           NSLog(@"-----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
          [NSThread sleepForTimeInterval:2];
        NSLog(@"1-----%@",[NSThread currentThread]);
    });
    
      NSLog(@"2-----%@",[NSThread currentThread]);
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
       
       dispatch_barrier_async(queue, ^{
           // 追加任务 barrier
           [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
           NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
       });
       
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
           NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
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

          dispatch_group_leave(group);
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
}
/**
 Dispatch Semaphore 线程同步
 */
- (IBAction)btn14:(id)sender {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int number = 0;
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        
        number = 100;
        
        dispatch_semaphore_signal(semaphore);
    });
      NSLog(@"2------------- ");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore---end,number = %d",number);
}
/**
 Dispatch Semaphore 线程安全和线程同步（为线程加锁）
 */
- (IBAction)btn15:(id)sender {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
       NSLog(@"semaphore---begin");
       
//       semaphoreLock = dispatch_semaphore_create(1);
//       
//       self.ticketSurplusCount = 50;
       
       // queue1 代表北京火车票售卖窗口
       dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
       // queue2 代表上海火车票售卖窗口
       dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
       
       __weak typeof(self) weakSelf = self;
       dispatch_async(queue1, ^{
           [weakSelf saleTicketSafe];
       });
       
       dispatch_async(queue2, ^{
           [weakSelf saleTicketSafe];
       });
}

/**
 * 售卖火车票（线程安全）
 */
- (void)saleTicketSafe {
//    while (1) {
//        // 相当于加锁
//        dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
//        
//        if (self.ticketSurplusCount > 0) {  // 如果还有票，继续售卖
//            self.ticketSurplusCount--;
//            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
//            [NSThread sleepForTimeInterval:0.2];
//        } else { // 如果已卖完，关闭售票窗口
//            NSLog(@"所有火车票均已售完");
//            
//            // 相当于解锁
//            dispatch_semaphore_signal(semaphoreLock);
//            break;
//        }
//        
//        // 相当于解锁
//        dispatch_semaphore_signal(semaphoreLock);
//    }
}
@end
