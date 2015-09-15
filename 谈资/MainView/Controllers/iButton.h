//
//  iButton.h
//  谈资
//
//  Created by 汇文 on 15/8/8.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iButton : UIControl {
    
    UIButton *button;
    UILabel *label;
    
}

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image withTitle:(NSString *)title;

@end
