//
//  DetailViewController.h
//  谈资
//
//  Created by 汇文 on 15/8/6.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "HederModel.h"
@interface DetailViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic,strong)Model *model;
@property(nonatomic,strong)HederModel *headermodel;
@end
