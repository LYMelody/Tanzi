//
//  AppDelegate.h
//  谈资
//
//  Created by 汇文 on 15/8/3.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "SinaWeibo.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,SinaWeiboDelegate> {
    MMDrawerController *MMDrawer;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong,nonatomic) SinaWeibo *sinaweibo;

@end

