//
//  ShareViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/8.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "ShareViewController.h"
#import "Common.h"
#import "iButton.h"
@interface ShareViewController ()

@end

@implementation ShareViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    //self.view.alpha = 0.3;
    //创建几个视图
    iButton *btn = [[iButton alloc] initWithFrame:CGRectMake(15, kScreenHeight + 100, 80, 80) withImage:[UIImage imageNamed:@"btn_share_sina@2x.png"] withTitle:@"新浪微博"];
    [self.view addSubview:btn];
    
    [UIView animateWithDuration:0.4 animations:^{
        btn.transform = CGAffineTransformMakeTranslation(0, -400);
    }];
    
    iButton *btn1 = [[iButton alloc] initWithFrame:CGRectMake(150, kScreenHeight + 100, 80, 80) withImage:[UIImage imageNamed:@"btn_share_weixin@2x.png"] withTitle:@"微信好友"];
    [self.view addSubview:btn1];
    
    [UIView animateWithDuration:0.5 animations:^{
        btn1.transform = CGAffineTransformMakeTranslation(0, -400);
    }];
    
    iButton *btn2 = [[iButton alloc] initWithFrame:CGRectMake(290, kScreenHeight + 100, 80, 80) withImage:[UIImage imageNamed:@"btn_share_pengyou@2x.png"] withTitle:@"朋友圈"];
    [self.view addSubview:btn2];
    [UIView animateWithDuration:0.6 animations:^{
        btn2.transform = CGAffineTransformMakeTranslation(0, -400);
    }];
    
    
    iButton *btn3 = [[iButton alloc] initWithFrame:CGRectMake(15, kScreenHeight + 100, 80, 80) withImage:[UIImage imageNamed:@"btn_share_qq@2x.png"] withTitle:@"QQ好友"];
    [self.view addSubview:btn3];
    [UIView animateWithDuration:0.7 animations:^{
        btn3.transform = CGAffineTransformMakeTranslation(0, -300);
    }];
    
    iButton *btn4 = [[iButton alloc] initWithFrame:CGRectMake(150, kScreenHeight + 100, 80, 80) withImage:[UIImage imageNamed:@"btn_share_qqzone@2x.png"] withTitle:@"QQ空间"];
    [self.view addSubview:btn4];
    [UIView animateWithDuration:0.8 animations:^{
        btn4.transform = CGAffineTransformMakeTranslation(0, -300);
    }];
    
    iButton *btn5 = [[iButton alloc] initWithFrame:CGRectMake(290, kScreenHeight + 100, 80, 80) withImage:[UIImage imageNamed:@"btn_share_copyLink@2x.png"] withTitle:@"复制链接"];
    [self.view addSubview:btn5];
    [UIView animateWithDuration:0.9 animations:^{
        btn5.transform = CGAffineTransformMakeTranslation(0, -300);
    }];

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
