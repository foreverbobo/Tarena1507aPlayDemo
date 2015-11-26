//
//  HeroEquipCell.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroEquipCell.h"

@implementation HeroEquipCell
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(15);
        }];
        _titleLb.font = [UIFont systemFontOfSize:15];
    }
    return _titleLb;
}

- (UILabel *)authorLb {
    if(_authorLb == nil) {
        _authorLb = [[UILabel alloc] init];
        [self.contentView addSubview:_authorLb];
        [_authorLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin).mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        _authorLb.font = [UIFont systemFontOfSize:13];
        _authorLb.textColor = [UIColor lightGrayColor];
    }
    return _authorLb;
}

- (UILabel *)combatLb {
    if(_combatLb == nil) {
        _combatLb = [[UILabel alloc] init];
        [self.contentView addSubview:_combatLb];
        [_combatLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.authorLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.authorLb.mas_topMargin).mas_equalTo(0);
            make.height.mas_equalTo(10);
        }];
        _combatLb.font = [UIFont systemFontOfSize:13];
        _combatLb.textColor = [UIColor lightGrayColor];
    }
    return _combatLb;
}
-(void)setEquipIdArr:(NSArray *)equipIdArr
{
    _equipIdArr = equipIdArr;
    CGFloat width = (kWindowW - 7*15)/6;
    NSInteger count = equipIdArr.count;
    HeroIconView *lastView = nil;
    for (int i = 0; i < count; i++) {
        NSInteger equipId = [equipIdArr[i] integerValue];
        HeroIconView *iconView = [HeroIconView new];
        iconView.equipId = equipId;
        [self.contentView addSubview:iconView];
        if(i == 0)
        {
            [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.combatLb.mas_bottom).mas_equalTo(10);
                make.left.mas_equalTo(15);
                make.size.mas_equalTo(CGSizeMake(width, width));
                make.bottom.mas_equalTo(-10);
            }];
        }
        else
        {
            [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(lastView);
                make.topMargin.mas_equalTo(lastView.mas_topMargin).mas_equalTo(0);
                make.left.mas_equalTo(lastView.mas_right).mas_equalTo(15);
            }];
        }
        lastView = iconView;
    }
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    }
    return self;
}
@end
