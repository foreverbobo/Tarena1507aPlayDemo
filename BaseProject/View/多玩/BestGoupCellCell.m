//
//  BestGoupCellCell.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BestGoupCellCell.h"
#define kPicGap (kWindowW - 50*5)/6
@implementation BestGoupCellCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kPicGap);
            make.right.mas_equalTo(-kPicGap);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(self.hero1.mas_top).mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (HeroIconView *)hero1 {
    if(_hero1 == nil) {
        _hero1 = [[HeroIconView alloc] init];
        [self.contentView addSubview:_hero1];
        [_hero1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kPicGap);
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.bottom.mas_equalTo(self.descLB.mas_top).mas_equalTo(-10);
        }];
    }
    return _hero1;
}

- (HeroIconView *)hero2 {
    if(_hero2 == nil) {
        _hero2 = [[HeroIconView alloc] init];
        [self.contentView addSubview:_hero2];
        [_hero2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hero1.mas_right).mas_equalTo(kPicGap);
            make.size.mas_equalTo(self.hero1);
            make.centerY.mas_equalTo(self.hero1);
        }];
    }
    return _hero2;
}

- (HeroIconView *)hero3 {
    if(_hero3 == nil) {
        _hero3 = [[HeroIconView alloc] init];
        [self.contentView addSubview:_hero3];
        [_hero3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hero2.mas_right).mas_equalTo(kPicGap);
            make.size.mas_equalTo(self.hero1);
            make.centerY.mas_equalTo(self.hero1);
        }];
    }
    return _hero3;
}

- (HeroIconView *)hero4 {
    if(_hero4 == nil) {
        _hero4 = [[HeroIconView alloc] init];
        [self.contentView addSubview:_hero4];
        [_hero4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hero3.mas_right).mas_equalTo(kPicGap);
            make.size.mas_equalTo(self.hero1);
            make.centerY.mas_equalTo(self.hero1);
        }];
    }
    return _hero4;
}

- (HeroIconView *)hero5 {
    if(_hero5 == nil) {
        _hero5 = [[HeroIconView alloc] init];
        [self.contentView addSubview:_hero5];
        [_hero5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hero4.mas_right).mas_equalTo(kPicGap);
            make.size.mas_equalTo(self.hero1);
            make.centerY.mas_equalTo(self.hero1);
        }];
    }
    return _hero5;
}
- (UILabel *)descLB {
    if(_descLB == nil) {
        _descLB = [[UILabel alloc] init];
        [self.contentView addSubview:_descLB];
        [_descLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kPicGap);
            make.right.mas_equalTo(-kPicGap);
            make.bottom.mas_equalTo(-10);
        }];
        _descLB.numberOfLines = 2;
        _descLB.font = [UIFont systemFontOfSize:14];
        _descLB.textColor = [UIColor lightGrayColor];
    }
    return _descLB;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
    
    }
    return self;

}
@end
