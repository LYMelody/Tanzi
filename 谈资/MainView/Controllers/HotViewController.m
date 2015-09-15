//
//  HotViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/4.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "HotViewController.h"
#import "NewViewController.h"
#import "NewTableView.h"
#import "NewTableViewCell.h"
#import "Common.h"
#import "WXDataService.h"
#import "Model.h"
#import "HederModel.h"


#define Newsurl    @"http://mobile.itanzi.com/wap/api/NewsList/1/0/10"
@interface HotViewController ()

@end

@implementation HotViewController {
    NewTableView  *_tableView;
    NSInteger index;
    NSString *Nexturl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _tableView = [[NewTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 105)];
    
    
    [self.view addSubview:_tableView];
    
    //网络请求
    [self requestWithUrl:Newsurl];
    
    //上拉
    __weak HotViewController *weakSelf = self;
    
    [_tableView setUpBlock: ^{
        [weakSelf _loadMoreInfo];
    }];
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
    Nexturl = [NSString stringWithFormat:@"http://mobile.itanzi.com/wap/api/NewsList/1/%li/10",index];
    
    [self requestWithUrl:Nexturl];
    
}


//网络请求
- (void)requestWithUrl:(NSString *)url {
    
    //url = Newsurl;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSMutableDictionary *header = [NSMutableDictionary dictionary];
    
    
    //网络请求数据
    [WXDataService requestWithURL:url  params:params httpMethod:@"GET" block:^(id result) {
        
        NSLog(@"%@",result);
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
            
            //            if (weibos.count < 18) {
            //                _tableView.isLastPage = YES;
            //            }
            //            else {
            //                _tableView.isLastPage = NO;
            //            }
        }
        
        //把赋值的model给tableView
        
        
    } requestHeader:header];
    
    
    
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
