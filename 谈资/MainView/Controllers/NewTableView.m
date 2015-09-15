//
//  NewTableView.m
//  谈资
//
//  Created by 汇文 on 15/8/5.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "NewTableView.h"
#import "NewTableViewCell.h"
#import "Common.h"
#import "UIImageView+AFNetworking.h"
#import "EGORefreshTableHeaderView.h"
#import "DetailViewController.h"
#import "UIView+ViewController.h"
#import "HaderDetailViewController.h"
#import "UIButton+AFNetworking.h"
@implementation NewTableView {
    NSString *_identy ;
    
    UILabel *_titleLabel1;
    UILabel *_titleLabel2;
    NSInteger index;
    DetailViewController *_detailVC;
    UIButton *_btn;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _createViews];
        //self.data.count = 20;
    }
    
    return self;
}
- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self _createViews];
}
//tableView初始化时调用的方法
- (void)_createViews {
    
    //设置代理
    self.dataSource = self;
    self.delegate = self;
    
     _identy = @"cell";
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"NewTableViewCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:_identy];

    //建立头视图
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    [_btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    
    _titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, kScreenWidth - 40, 20)];
    _titleLabel1.backgroundColor = [UIColor redColor];
    _titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, kScreenWidth - 40, 25)];
    
    _titleLabel2.backgroundColor = [UIColor whiteColor];
    _titleLabel2.alpha = 0.5;
    
    [_btn addSubview:_titleLabel1];
    [_btn addSubview:_titleLabel2];
    self.tableHeaderView = _btn;
    
   
    _refreshHeader = YES;
    //创建下拉刷新控件
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0 - self.bounds.size.height  , self.bounds.size.width, self.bounds.size.height )];
    //设置代理
    _refreshHeaderView.delegate = self;
    
    _refreshHeaderView.backgroundColor = [UIColor clearColor];
    [self addSubview:_refreshHeaderView];
    
    //创建上啦加载控件
    _refreshFooterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _refreshFooterButton.frame = CGRectMake(0, 0, self.bounds.size.width, 40);
    _refreshFooterButton.backgroundColor = [UIColor clearColor];
    
    [_refreshFooterButton setTitle:@"上拉加载更多..." forState:UIControlStateNormal];
    [_refreshFooterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _refreshFooterButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    
    
    [_refreshFooterButton addTarget:self action:@selector(loadMoreAction) forControlEvents:UIControlEventTouchUpInside];
    //_refreshFooterButton.hidden = YES;
    
    //风火轮
    _loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _loadView.frame = CGRectMake(90, 10, 20, 20);
    [_loadView stopAnimating];
    [_refreshFooterButton addSubview:_loadView];
    
    
    //将按钮添加到尾视图
    self.tableFooterView = _refreshFooterButton;
    //NSLog(@"%@",self.tableFooterView);
}

- (void)clickAction {
    
        HaderDetailViewController *headerDetail = [[HaderDetailViewController alloc] init];
    //给头视图详情控制器model赋值
        headerDetail.headermodel = self.headerModel;
    
        [self.viewController.navigationController pushViewController:headerDetail animated:YES];

    
    
}

- (void)loadMoreAction {
    //index += 1;
    _uploading = YES;
    NSLog(@"开始上拉加载了");
    
    _refreshFooterButton.enabled = NO;
    [_refreshFooterButton setTitle:@"正在加载...." forState:UIControlStateNormal];

    if (self.upBlock) {
        self.upBlock();
    }
    
    [self performSelector:@selector(setIsLastPage:) withObject:@NO afterDelay:2];
}

- (void)setIsLastPage:(BOOL)isLastPage {
    
    _isLastPage = isLastPage;
    
    if (!isLastPage) {
        [_refreshFooterButton setTitle:@"上拉加载更多..." forState:UIControlStateNormal];
        _refreshFooterButton.enabled = YES;
    }else {
        [_refreshFooterButton setTitle:@"加载完成" forState:UIControlStateNormal ];
        _refreshFooterButton.enabled = NO;
        
    }
    
    [_loadView stopAnimating];
    _uploading = NO;
    
}
//控制下拉刷新控件是否显示
- (void)setRefreshHeader:(BOOL)refreshHeader {
    
    _refreshHeader = refreshHeader;
    if (!_refreshHeader) {
        [_refreshHeaderView removeFromSuperview];
    }
}


#pragma mark -下拉刷新控件的协议方法

- (void)reloadTableViewDataSource {
    _reloading = YES;
    [self reloadData];
}



- (void)doneLoadingTableViewData {
    
    _reloading = NO;
    //收回下拉控件
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //调用下拉方法
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
    CGFloat h1 = scrollView.contentOffset.y + CGRectGetHeight(scrollView.bounds);
    
    CGFloat h2 = scrollView.contentSize.height;
    
    NSLog(@"h1:%.2f,h2:%.2f", h1,h2);
    
    //当上拉偏移量大于一定数值时，触发上拉加载操作
    if (h1 - h2 > 30 && !_uploading) {
        
        [self loadMoreAction];
    }

    
}

//下拉到一定距离，手指放开开始调用
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view {
    
    [self reloadTableViewDataSource];
    
    _reloading = YES;
    
    if (self.pullBlock) {
        self.pullBlock();
    }
    
    
    [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3];
    
    
}
//返回当前刷新的状态
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view {
    return _reloading;
}

//取得下拉刷新的时间
- (NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view {
    
    return  [NSDate date];
    
}

#pragma mark -UITableView  Delegate




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
     return  self.data.count;
    //return 20;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //NewTableViewCell *cell = (NewTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
   
    
    NewTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:_identy];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewTableViewCell" owner:nil options:nil] lastObject];
        
    }
    cell.model = self.data[indexPath.row];
    
    NSString *str = [self.headerModel.titleImageView stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //[_btn setImageWithURL:[NSURL URLWithString:str]];
    //[_btn setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:str]];
    [_btn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:str]];
    _titleLabel1.text = self.headerModel.reftitle;
    _titleLabel2.text = self.headerModel.title;
    
    
    
    //NSLog(@"%@",cell.model);
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

//单元格被点击实现的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _detailVC = [[DetailViewController alloc] init];
    
    _detailVC.model = self.data[indexPath.row];
    
    [self.viewController.navigationController pushViewController:_detailVC animated:YES];
    
    
}





@end
