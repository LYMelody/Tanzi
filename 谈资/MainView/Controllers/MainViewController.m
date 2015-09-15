//
//  MainViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/3.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "MainViewController.h"
#import "NavViewController.h"
#import "LeftViewController.h"
#import "SearchViewController.h"
#import "AppDelegate.h"
#import "UIViewController+MMDrawerController.h"
#import "SCNavTabBarController.h"
#import "NewViewController.h"
#import "HotViewController.h"
#import "ShenbaViewController.h"
#import "GanhuoViewController.h"
#import "GaoxiaoViewController.h"
#import "LaiwanViewController.h"
#import "SuijiViewController.h"
#import "FuliViewController.h"
#import "MengmengViewController.h"
#import "Common.h"
@interface MainViewController ()

@end

@implementation MainViewController




- (void)viewDidLoad {
    [super viewDidLoad];
   //创建导航栏按钮
    [self _createNavs];
    
    //创建多哥选项视图
    [self _crectecontrollers];
    
}

- (void)_createNavs {
    
    
    
    //self.navigationController.navigationBar.barTintColor = color;
    
    //UIImage *backImg =
    
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"splash_btn_enter_app@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [button1 setTitle:@"谈资" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    button1.tintColor = [UIColor whiteColor];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [button2 setTitle:@"搜索" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    button2.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:button2];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)_crectecontrollers {
    
    SCNavTabBarController *sacvTabBarCTL = [[SCNavTabBarController alloc] init];
    
    NewViewController *newVC = [[NewViewController alloc] init];
    newVC.title = @"最新";
    newVC.view.backgroundColor = [UIColor orangeColor];
    
    HotViewController *hotVC = [[HotViewController alloc] init];
    hotVC.title = @"最热";
    hotVC.view.backgroundColor = [UIColor blueColor];
    
    ShenbaViewController *shenbaVC = [[ShenbaViewController alloc] init];
    shenbaVC.title = @"深八";
    shenbaVC.view.backgroundColor = [UIColor yellowColor];
    
    GanhuoViewController *ganhuoVC = [[GanhuoViewController alloc] init];
    ganhuoVC.title = @"干货";
    ganhuoVC.view.backgroundColor = [UIColor whiteColor];
    
    GaoxiaoViewController *gaoxiaoVC = [[GaoxiaoViewController alloc] init];
    gaoxiaoVC.title = @"搞笑";
    gaoxiaoVC.view.backgroundColor = [UIColor grayColor];
    
    LaiwanViewController *laiwanVC = [[LaiwanViewController alloc] init];
    laiwanVC.title = @"来玩";
    laiwanVC.view.backgroundColor = [UIColor purpleColor];
    
    SuijiViewController *suijiVC = [[SuijiViewController alloc] init];
    suijiVC.title = @"随机";
    suijiVC.view.backgroundColor = [UIColor greenColor];
    
    FuliViewController *fuliVC = [[FuliViewController alloc] init];
    fuliVC.title = @"福利";
    
    MengmengViewController *mengmeng = [[MengmengViewController alloc] init];
    mengmeng.title = @"萌萌";
    
    
    
    
    sacvTabBarCTL.subViewControllers = @[newVC,hotVC,shenbaVC,ganhuoVC,gaoxiaoVC,laiwanVC,fuliVC,mengmeng,suijiVC];
    sacvTabBarCTL.showArrowButton = YES;
    [sacvTabBarCTL addParentController:self];
    
}
- (void)clickAction {

    NSLog(@"ksahfksh");
    MMDrawerController *mmd = self.mm_drawerController;
    [mmd openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
}

- (void)searchAction {
    
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    
    [self.navigationController pushViewController:searchVC animated:YES];
    
    
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
