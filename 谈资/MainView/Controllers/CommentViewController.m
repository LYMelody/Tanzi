//
//  CommentViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/8.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "CommentViewController.h"
#import "Common.h"
@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //背景图片
    UIImageView *backImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bkg_no_comment@2x.png"]];
    backImg.frame = CGRectMake(140, 100, 100, 100);
    [self.view addSubview:backImg];
    
    
    
    
    UIView *commentView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, kScreenWidth, 50)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *CommentText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 50, 50)];
    
    CommentText.placeholder = @"谈一谈你的看法";
    [CommentText becomeFirstResponder];

    UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 50, 0, 50, 50)];
    sendBtn.backgroundColor = [UIColor orangeColor];
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [commentView addSubview:CommentText];
    [commentView addSubview:sendBtn];
    //[CommentText addSubview:sendBtn];
    
    [self.view addSubview:commentView];
    
    
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
