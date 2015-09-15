//
//  DetailViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/6.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "DetailViewController.h"
#import "Common.h"
#import "DetailViewController.h"
#import "CommentViewController.h"
#import "UIView+ViewController.h"
#import "EmotionViewController.h"
#import "ShareViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController {
    NSString *_str1;
    NSString *_str;
    UIView *_tabbarView;
    UIWebView *_web;
    UIButton *_button2;
    BOOL _isCollection;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //返回按钮标题一致改成”返回"
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = backItem;
    
    //DetailViewController *detail = [[DetailViewController alloc] init];
    
    

    
    
   _str1 = [self.model.ContentUrl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    

    self.view.backgroundColor = [UIColor whiteColor];
    
    

    
    _web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _web.scalesPageToFit = YES;
    
    
    NSURL *url = [NSURL URLWithString:_str1];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_web loadRequest:request];
    
    _web.delegate =self;
    
    [self.view addSubview:_web];
    
    [self _createButtons];
    
    
}


- (void)_createButtons {
    
    
    _tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, 555, kScreenWidth, 50)];
    _tabbarView.backgroundColor = [UIColor whiteColor];
    
    NSArray *imgNames = @[
                          @"btn_comment@2x.png",
                          @"btn_collect@2x.png",
                          @"btn_commend@2x.png",
                          @"btn_share@2x.png"
                          
                          ];
    
    //评论按钮
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 40, 40)];
    button1.backgroundColor = [UIColor clearColor];
    [button1 setBackgroundImage:[UIImage imageNamed:imgNames[0]] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(Comment) forControlEvents:UIControlEventTouchUpInside];
    
    
    //收藏按钮
    _button2 = [[UIButton alloc] initWithFrame:CGRectMake(110, 5, 40, 40)];
    _button2.backgroundColor = [UIColor clearColor];
    [_button2 setBackgroundImage:[UIImage imageNamed:imgNames[1]] forState:UIControlStateNormal];
    [_button2 addTarget:self action:@selector(collection:) forControlEvents:UIControlEventTouchUpInside];
    _isCollection = NO;
    
    
    
    //表情按钮
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(200, 5, 40, 40)];
    button3.backgroundColor = [UIColor clearColor ];
    [button3 setBackgroundImage:[UIImage imageNamed:imgNames[2]] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(emotion) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //分享按钮
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(290, 5, 40, 40)];
    button4.backgroundColor = [UIColor clearColor];
    [button4 setBackgroundImage:[UIImage imageNamed:imgNames[3]] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    [_tabbarView addSubview:button1];
    [_tabbarView addSubview:_button2];
    [_tabbarView addSubview:button3];
    [_tabbarView addSubview:button4];
    
    //[self.tabBar addSubview:_tabbarView];
    
    [_web addSubview:_tabbarView];
    //NSLog(@"%@",button1);
    
    
}

//评论按钮实现方法
- (void)Comment{
    
    CommentViewController *commentView = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:commentView animated:YES];
    
}
//收藏按钮实现方法
- (void)collection:(UIButton *)btn {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, kScreenHeight + 40, 100, 40)];
    label.backgroundColor = [UIColor grayColor];
    label.alpha = 0.5;
    [self.view addSubview:label];
    
    if (!_isCollection) {
        
        [_button2 setBackgroundImage:[UIImage imageNamed:@"iconMyFavorites@2x.png"] forState:UIControlStateNormal];
        
        //
        label.text = @"收藏成功";
        label.textAlignment = NSTextAlignmentCenter;
        //设置动画
        [UIView animateWithDuration:1 animations:^{
            
            label.transform = CGAffineTransformMakeTranslation(0, -250);
            
            
            //设置按钮动画
            [UIView animateWithDuration:0.1 animations:^{
                
                _button2.transform = CGAffineTransformMakeScale(1.5, 1.5);
                
            }completion:^(BOOL finished) {
                
                _button2.transform = CGAffineTransformIdentity;
                
            }];
            
            
            
        }completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.7 animations:^{
                
                [UIView setAnimationDelay:1];
                
                label.hidden = YES;
            }];
            
            
        }];
        
        
        _isCollection = YES;
        
    }
    
    else if (_isCollection) {
        [_button2 setBackgroundImage:[UIImage imageNamed:@"btn_collect@2x.png"] forState:UIControlStateNormal];
        //
        label.text = @"已取消收藏";
        label.textAlignment = NSTextAlignmentCenter;
        //设置动画
        [UIView animateWithDuration:1 animations:^{
            
            label.transform = CGAffineTransformMakeTranslation(0, -250);
            
            
            
            //按钮设置动画
            [UIView animateWithDuration:0.1 animations:^{
                
                _button2.transform = CGAffineTransformMakeScale(1.5, 1.5);
                
            }completion:^(BOOL finished) {
                
                _button2.transform = CGAffineTransformIdentity;
                
            }];
            
            
            
        }completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.7 animations:^{
                
                [UIView setAnimationDelay:1];
                
                
                label.hidden = YES;
            }];
            
            
        }];
        
        
        _isCollection = NO;
    }
    
    
}

//表情按钮的方法实现
- (void)emotion {
    
    EmotionViewController *emotionVC = [[EmotionViewController alloc] init];
    [self.navigationController pushViewController:emotionVC animated:YES];
    
    
}

//分享按钮方法的实现
- (void)share {
    
    ShareViewController *shareVC = [[ShareViewController alloc] init];
    [self.navigationController pushViewController:shareVC animated:YES];
    
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //NSLog(@"加载后%@",_str1);
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载后的url%@",_str1);
    NSLog(@"%@",error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
