//
//  XiMaCategoryCell.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "XiMaCategoryCell.h"

@implementation XiMaCategoryCell
- (UILabel *)orderLB {
    if(_orderLB == nil) {
        _orderLB = [[UILabel alloc] init];
        _orderLB.font = [UIFont boldSystemFontOfSize:17];
        _orderLB.textColor = [UIColor lightGrayColor];
        _orderLB.textAlignment = NSTextAlignmentCenter;
        [_orderLB bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value = change[@"new"];
            if([value isEqualToString:@"1"])
            {
                _orderLB.textColor = [UIColor redColor];
            }else if([value isEqualToString:@"2"])
            {
                _orderLB.textColor = [UIColor blueColor];
            }
            else if ([value isEqualToString:@"3"])
            {
                _orderLB.textColor = [UIColor greenColor];
            }
            else
            {
                _orderLB.textColor = [UIColor blackColor];
            }
        }];
        [self.contentView addSubview:_orderLB];
    }
    return _orderLB;
}

- (WBImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[WBImageView alloc] init];
        [self.contentView addSubview:_iconIV];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLB];
    }
    return _titleLB;
}

- (UILabel *)descLB {
    if(_descLB == nil) {
        _descLB = [[UILabel alloc] init];
        _descLB.font = [UIFont systemFontOfSize:15];
        _descLB.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLB];
    }
    return _descLB;
}

- (UILabel *)numberLB {
    if(_numberLB == nil) {
        _numberLB = [[UILabel alloc] init];
        _numberLB.font = [UIFont systemFontOfSize:12];
        _numberLB.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberLB];
    }
    return _numberLB;
}

- (WBImageView *)numberIcon {
    if(_numberIcon == nil) {
        _numberIcon = [[WBImageView alloc] init];
        _numberIcon.imageView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIcon];
    }
    return _numberIcon;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.orderLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(30);
        }];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLB.mas_right).mas_equalTo(0);
        }];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        [self.descLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
           // make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
        }];
        [self.numberLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIcon.mas_right).mas_equalTo(2);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIcon);
        }];
        self.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
        
    }
    return self;

}

@end
