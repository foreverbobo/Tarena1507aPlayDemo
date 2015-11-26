//
//  HeroMediaCell.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroMediaCell.h"

@implementation HeroMediaCell
- (WBImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[WBImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(105, 70));
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _imageV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imageV.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.imageV.mas_topMargin).mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
        _titleLB.numberOfLines = 2;
        
    }
    return _titleLB;
}

- (UILabel *)timeLB {
    if(_timeLB == nil) {
        _timeLB = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLB];
        [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imageV.mas_right).mas_equalTo(10);
            make.bottomMargin.mas_equalTo(self.imageV.mas_bottomMargin).mas_equalTo(0);
        }];
        _timeLB.font = [UIFont systemFontOfSize:12];
        _timeLB.textColor = [UIColor lightGrayColor];
    }
    return _timeLB;
}

- (UILabel *)updateLB {
    if(_updateLB == nil) {
        _updateLB = [[UILabel alloc] init];
        [self.contentView addSubview:_updateLB];
        [_updateLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-60);
            make.bottomMargin.mas_equalTo(self.imageV.mas_bottomMargin).mas_equalTo(0);
        }];
        _updateLB.font = [UIFont systemFontOfSize:12];
        _updateLB.textColor = [UIColor lightGrayColor];
    }
    return _updateLB;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    return self;
}

@end
