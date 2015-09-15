//
//  NewTableView.h
//  谈资
//
//  Created by 汇文 on 15/8/5.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "HederModel.h"
#import "EGORefreshTableHeaderView.h"

//定义block类型
typedef void(^PullDownTableView)(void);


@interface NewTableView : UITableView <UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate,UIGestureRecognizerDelegate> {
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading; //判断是否在下拉刷新中
    
    UIButton *_refreshFooterButton;
    
    BOOL _uploading; //判断当前是否在上啦加载
    
    UIActivityIndicatorView *_loadView;
}



@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)HederModel *headerModel;
//设置一个开关，来控制当前tableView是否需要下拉刷新
@property(nonatomic,assign)BOOL refreshHeader;
//判断是否为最后一页，控制上啦控件的显示
@property(nonatomic,assign)BOOL isLastPage;
//定义一个block属性来通知下拉刷新事件
@property(nonatomic,copy)PullDownTableView pullBlock;
//定义一个block属性来通知上拉加载事件
@property(nonatomic,copy)PullDownTableView upBlock;
//收回下拉加载控件
- (void)doneLoadingTableViewData;
@end
