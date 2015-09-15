//
//  NewTableViewCell.h
//  谈资
//
//  Created by 汇文 on 15/8/5.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Model.h"
#import "HederModel.h"
@interface NewTableViewCell : UITableViewCell

@property(nonatomic,strong)Model *model;
@property(nonatomic,strong)HederModel *headerModel;

@property (weak, nonatomic) IBOutlet UIImageView *NewImageView;
@property (weak, nonatomic) IBOutlet UILabel *NewTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *NewHasReadLabel;

@end
