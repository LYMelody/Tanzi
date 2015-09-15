//
//  NewTableViewCell.m
//  谈资
//
//  Created by 汇文 on 15/8/5.
//  Copyright (c) 2015年 周辉平. All rights reserved.
//

#import "NewTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation NewTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    
    
    
}

- (void)setModel:(Model *)model {
    
    if (_model != model) {
        _model = model;
        
        [self setNeedsDisplay];
    }
    
}

- (void)setHeaderModel:(HederModel *)headerModel {
    if (_headerModel != headerModel) {
        _headerModel = headerModel;
        [self setNeedsDisplay];
    }
}

//把数据交给cell
- (void)layoutSubviews {
    
//    NSString *str1 = [self.model.ContentUrl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"内容为:%@",str1);
    
    [super layoutSubviews];
    
    NSString *str = [self.model.NewsImageView stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    [self.NewImageView setImageWithURL:[NSURL URLWithString:str]];
    self.NewTitleLabel.text = self.model.Title;
    self.NewHasReadLabel.text =[NSString stringWithFormat:@"阅读 %li",[self.model.ReadNum integerValue]];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
