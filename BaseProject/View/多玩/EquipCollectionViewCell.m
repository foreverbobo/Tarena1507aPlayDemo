//
//  EquipCollectionViewCell.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "EquipCollectionViewCell.h"

@implementation EquipCollectionViewCell
- (HeroIconView *)iconView {
    if(_iconView == nil) {
        _iconView = [[HeroIconView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.left.mas_equalTo(0);
            make.bottom.mas_equalTo(self.nameLB.mas_top).mas_equalTo(0);
        }];
    }
    return _iconView;
}

- (UILabel *)nameLB {
    if(_nameLB == nil) {
        _nameLB = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.left.mas_equalTo(0);
            make.height.mas_equalTo(15);
        }];
        _nameLB.numberOfLines = 0;
        _nameLB.font = [UIFont systemFontOfSize:15];
        _nameLB.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLB;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
    
    }
    return self;

}
@end
