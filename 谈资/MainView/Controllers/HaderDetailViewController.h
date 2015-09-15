//
//  HaderDetailViewController.h
//  谈资
//
//  Created by 汇文 on 15/8/7.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HederModel.h"
@interface HaderDetailViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic,strong)HederModel *headermodel;
@end
