//
//  SearchViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/3.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController {
    UITextField *_text;
}
- (void)viewWillAppear:(BOOL)animated {
    _text.hidden = NO;
    [_text becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //返回按钮标题一致改成”返回"
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = backItem;
    

    self.view.backgroundColor = [UIColor whiteColor];
    
    _text = [[UITextField alloc] initWithFrame:CGRectMake(70, 20, 200, 50)];
    _text.placeholder = @"请输入关键字";
    
    _text.textColor = [UIColor whiteColor];
    [_text becomeFirstResponder];
    [self.navigationController.view addSubview:_text];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    _text.hidden = YES;
    [_text resignFirstResponder];
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
