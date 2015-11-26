//
//  HeroDetailCollectionViewCell.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroDetailCollectionViewCell.h"

@implementation HeroDetailCollectionViewCell
- (HeroIconView *)icon {
    if(_icon == nil) {
        _icon = [[HeroIconView alloc] init];
        [self.contentView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(60);
        }];
    }
    return _icon;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.icon.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(0);
            make.topMargin.mas_equalTo(self.icon.mas_topMargin).mas_equalTo(0);
        }];
        _titleLb.numberOfLines = 1;
        _titleLb.font = [UIFont systemFontOfSize:14];
        _titleLb.textColor = [UIColor blackColor];
    }
    return _titleLb;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin).mas_equalTo(0);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin).mas_equalTo(0);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(3);
        }];
        _nameLb.numberOfLines = 1;
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textColor = [UIColor lightGrayColor];
    }
    return _nameLb;
}

- (UILabel *)locationLb {
    if(_locationLb == nil) {
        _locationLb = [[UILabel alloc] init];
        [self.contentView addSubview:_locationLb];
        [_locationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin).mas_equalTo(0);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin).mas_equalTo(0);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(3);
        }];
        _locationLb.numberOfLines = 1;
        _locationLb.font = [UIFont systemFontOfSize:13];
        _locationLb.textColor = [UIColor blueColor];
    }
    return _locationLb;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        
    }
    return self;
    
}
@end
