//
//  iButton.m
//  谈资
//
//  Created by 汇文 on 15/8/8.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "iButton.h"

@implementation iButton


- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image withTitle:(NSString *)title {
    
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
        
        button = [[UIButton alloc] initWithFrame:CGRectZero];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        button.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:button];
        
        
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        //label.backgroundColor = [UIColor orangeColor];
        label.text = title;
        label.contentMode = UIViewContentModeScaleAspectFit;
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        
    }
    
    return self;
}
//布局子视图
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 20);
    label.frame = CGRectMake(0, self.frame.size.height - 20 , self.frame.size.width, 20);
    
    
}

@end
