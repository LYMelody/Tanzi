//
//  NavViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/3.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "NavViewController.h"
#import "Common.h"
@interface NavViewController ()

@end

@implementation NavViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏背景颜色
    //UIColor *color = [UIColor colorWithRed:90 green:128 blue:110 alpha:1];
    UIImage *backImg = [self imageWithColor:[UIColor redColor]];
    
    [self.navigationBar setBackgroundImage:backImg forBarMetrics:UIBarMetricsDefault];
    
    //返回按钮标题一致改成”返回"
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = backItem;
    

    
    
}


-(UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
