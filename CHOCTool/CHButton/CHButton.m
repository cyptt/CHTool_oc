//
//  CHButton.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/7.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHButton.h"

@implementation CHButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
//-(void)drawRect:(CGRect)rect{
//
//}

- (void)layoutSubviews{
    [super layoutSubviews];
//       image center
       CGPoint center;
       center.x = self.frame.size.width/2;
       center.y = self.imageView.frame.size.height/2;
       self.imageView.center = center;
  
      //text
      CGRect newFrame = [self titleLabel].frame;
      newFrame.origin.x = 0;
      newFrame.origin.y = self.imageView.frame.size.height + 5;
      newFrame.size.width = self.frame.size.width;
 
      self.titleLabel.frame = newFrame;
      self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
