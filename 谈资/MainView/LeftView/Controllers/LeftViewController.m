//
//  LeftViewController.m
//  谈资
//
//  Created by 汇文 on 15/8/3.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "LeftViewController.h"
#import "Common.h"
#import "LeftTableViewCell.h"
@interface LeftViewController ()

@end

@implementation LeftViewController {
    
    UIView *_headerView;
    NSArray *_titleArr;
    NSArray *_imgArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300,kScreenHeight ) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];

    [self _creatHeardView];
    
    tableView.tableHeaderView = _headerView;
    
    _titleArr = @[
                          @"我的收藏",
                          @"我的评论",
                          @"我的逗币",
                          @"推送设置",
                          @"应用推荐",
                          @"意见反馈",
                          @"清楚缓存"
                          ];
   _imgArr = @[
                        @"iconMyFavorites@2x.png",
                        @"iconPhone@2x.png",
                        @"iconPasswordPersonCenter@2x.png",
                        @"iconPush@2x.png",
                        @"iconRecommended@2x.png",
                        @"iconFeedback@2x.png",
                        @"btnDeletedFavorites@2x.png"
                        
                        ];
    

    
}

- (void)_creatHeardView {
    
     _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 40, 80, 80)];
    [button1 setImage:[UIImage imageNamed:@"iconNotLogin@2x.png"] forState:UIControlStateNormal];
    button1.tag = 101;
    
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 120, 40)];
    label1.text = @"注册";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor redColor];
    label1.tag = 102;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(161, 110, 120, 39)];
    label2.text = @"登陆";
    label2.textColor = [UIColor redColor];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.tag = 103;
    
    [_headerView addSubview:button1];
    [_headerView addSubview:label2];
    [_headerView addSubview:label1];
    
}

#pragma mark -UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 3;
    
    }else
        return 4;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
           return 50;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LeftTableViewCell *cell = (LeftTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    //UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LeftTableViewCell" owner:nil options:nil] lastObject];
        if (indexPath.section == 0 ) {
            
            NSString *name = _imgArr[indexPath.row];
            
            cell.ImageView.image = [UIImage imageNamed:name];
            
            cell.LeftLabel.text = _titleArr[indexPath.row];
            
            
        }
        
        if (indexPath.section == 1) {
            
            
            cell.ImageView.image = [UIImage imageNamed:_imgArr[indexPath.row + 3]];
            cell.LeftLabel.text = _titleArr[indexPath.row + 3];
            
        }
        
    }
    
   
    cell.RightView.image = [UIImage imageNamed:@"btnNavigation@2x.png"];
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        [cell.RightView removeFromSuperview];
        UISwitch *Switch = [[UISwitch alloc] initWithFrame:CGRectMake(215, 10, 25, 30)];
        Switch.onTintColor = [UIColor redColor];
        //cell.userInteractionEnabled = NO;
        [cell.contentView  addSubview:Switch];
    }
    else if (indexPath.section == 1 && indexPath.row == 3) {
        [cell.RightView removeFromSuperview];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 10, 40, 20)];
        rightLabel.text = @"缓存";
        rightLabel.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:rightLabel];
        
    }
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    
    
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
