//
//  EmotionViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/8.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "EmotionViewController.h"
#import "Common.h"


@interface EmotionViewController ()

@end

@implementation EmotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建表情
    UIButton *img1 = [[UIButton alloc] initWithFrame:CGRectMake(5, kScreenHeight - 40, 50, 50)];
    [img1 addTarget:self action:@selector(selectAction :) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *img2 = [[UIButton alloc] initWithFrame:CGRectMake(65, kScreenHeight - 40, 50, 50)];
    [img2 addTarget:self action:@selector(selectAction1 :) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *img3 = [[UIButton alloc] initWithFrame:CGRectMake(125, kScreenHeight - 40, 50, 50)];
    [img3 addTarget:self action:@selector(selectAction2:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *img4 = [[UIButton alloc] initWithFrame:CGRectMake(190, kScreenHeight - 40, 50, 50)];
    [img4 addTarget:self action:@selector(selectAction3:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *imgarr = @[@"btn_commend_zan@2x.png",
                        @"btn_commend_ha@2x.png",
                        @"btn_commend_jiong@2x.png",
                        @"btn_commend_jing@2x.png"
                        ];
    
    [img1 setBackgroundImage:[UIImage imageNamed:imgarr[0]] forState:UIControlStateNormal];
    [img2 setBackgroundImage:[UIImage imageNamed:imgarr[1]] forState:UIControlStateNormal];
    [img3 setBackgroundImage:[UIImage imageNamed:imgarr[2]] forState:UIControlStateNormal];
    [img4 setBackgroundImage:[UIImage imageNamed:imgarr[3]] forState:UIControlStateNormal];
    
    [self.view addSubview:img1];
    [self.view addSubview:img2];
    [self.view addSubview:img3];
    [self.view addSubview:img4];
    
    [UIView animateWithDuration:0.7 animations:^{
        img1.transform = CGAffineTransformMakeTranslation(0, -300);
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        img2.transform = CGAffineTransformMakeTranslation(0, -300);
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        img3.transform = CGAffineTransformMakeTranslation(0, -300);
    }];
    
    [UIView animateWithDuration:0.8 animations:^{
        img4.transform = CGAffineTransformMakeTranslation(0, -300);
    }];
    
    
    
}


- (void)selectAction:(UIButton *)btn {
    
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_commend_zan_sel@2x.png"] forState:UIControlStateNormal];
    
}
- (void)selectAction1 :(UIButton *)btn {
    
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_commend_ha_sel@2x.png"] forState:UIControlStateNormal];
    
}

- (void)selectAction2:(UIButton *)btn {
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_commend_jiong_sel@2x.png"] forState:UIControlStateNormal];
    
}

- (void)selectAction3:(UIButton *)btn {
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_commend_jing_sel@2x.png"] forState:UIControlStateNormal];
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
