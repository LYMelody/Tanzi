//
//  NewViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/4.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "NewViewController.h"
#import "WXDataService.h"
#import "Model.h"
#import "HederModel.h"
#import "NewTableView.h"
#import "NewTableViewCell.h"
#import "Common.h"


#define Newsurl    @"http://mobile.itanzi.com/wap/api/NewsList/0/0/10"
//#define Nexturl    @"http://mobile.itanzi.com/wap/api/NewsList/0/1/10"






@interface NewViewController ()

@end

@implementation NewViewController {
    NewTableView  *_tableView;
    NSInteger index;
    NSString *Nexturl;
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    
    _tableView = [[NewTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 105)];
    
    
    [self.view addSubview:_tableView];
    
    //网络请求
    [self requestWithUrl:Newsurl];
   
    
    
    //上拉
    __weak NewViewController *weakSelf = self;
    
    [_tableView setUpBlock: ^{
        [weakSelf _loadMoreInfo];
    }];
    
    //设置下拉block
    __weak NewTableView *weakTableView = _tableView;
    [_tableView setPullBlock:^{
        [weakTableView performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:2.0];
        [weakSelf _loadNewInfo];
        
        
    }];
    
    
}

- (void)_loadNewInfo {
    
    [self requestWithUrl:Newsurl];
    
    
}
- (void)_loadMoreInfo {
    
    index += 1;
    Nexturl = [NSString stringWithFormat:@"http://mobile.itanzi.com/wap/api/NewsList/0/%li/10",index];
    
    [self requestWithUrl:Nexturl];
    
}

//网络请求
- (void)requestWithUrl:(NSString *)url {
   
    //url = Newsurl;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSMutableDictionary *header = [NSMutableDictionary dictionary];

    
    //网络请求数据
    [WXDataService requestWithURL:url  params:params httpMethod:@"GET" block:^(id result) {
        
       // NSLog(@"%@",result);
        NSMutableDictionary *dic = result[@"Data"];
        
        if ([url isEqualToString:Newsurl]) {
            //获取头视图数据
            NSArray *hotarr = dic[@"Hot"];
            NSMutableDictionary *hotDic = hotarr[0];
            HederModel *headerModel = [[HederModel alloc] init];
            headerModel.titleImageView = hotDic[@"ImageUrl"];
            headerModel.title = hotDic[@"NewsTitle"];
            headerModel.reftitle = hotDic[@"NewsSubTitle"];
            headerModel.contenturl = hotDic[@"ContentUrl"];
            _tableView.headerModel = headerModel;
        }
        
        
      
        //获取列表视图数据
        NSArray *nomarlArr = dic[@"Normal"];
        NSLog(@"%li",nomarlArr.count);
        
        NSMutableArray *weibos = [NSMutableArray arrayWithCapacity:nomarlArr.count ];
        
        
        //将获取的model给数组
        for (NSDictionary *Newmodel in nomarlArr) {
            
            Model *model = [[Model alloc] init];
            
            model.NewsImageView = [Newmodel objectForKey:@"ImageUrl"];
            model.Title = [Newmodel objectForKey:@"NewsTitle"];
            model.ReadNum = [Newmodel objectForKey:@"HasRead"] ;
            model.ContentUrl = [Newmodel objectForKey:@"ContentUrl"];
            [weibos addObject:model];
        }
        
        if ([url isEqualToString:Newsurl]) {
            _tableView.data = weibos;
            
            [_tableView reloadData];
        }else if ([url isEqualToString:Nexturl]) {
            
            NSLog(@"开始添加数据了");
            [_tableView.data addObjectsFromArray:weibos];
            
            
            
            [_tableView reloadData];
            
        }
        
        
        
    } requestHeader:header];

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
