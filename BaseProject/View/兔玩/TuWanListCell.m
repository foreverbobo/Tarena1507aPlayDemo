//
//  TuWanListCell.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/6.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell
-(WBImageView *)iconView
{
    if(!_iconView)
    {
        _iconView = [[WBImageView alloc]init];
      //  _iconView.contentMode = PHImageContentModeAspectFill;
    }
    return _iconView;
}
-(UILabel *)titleLB
{
    if(!_titleLB)
    {
        _titleLB = [[UILabel alloc]init];
        _titleLB.font = [UIFont systemFontOfSize:17];
    }
    return _titleLB;
}
-(UILabel *)longTitleLB
{
    if(!_longTitleLB)
    {
        _longTitleLB = [[UILabel alloc]init];
        _longTitleLB.font = [UIFont systemFontOfSize:14];
        _longTitleLB.numberOfLines = 0;
        _longTitleLB.textColor = [UIColor lightGrayColor];
    }
    return _longTitleLB;
}
-(UILabel *)clicksLB
{
    if(!_clicksLB)
    {
        _clicksLB = [[UILabel alloc]init];
        _clicksLB.font = [UIFont systemFontOfSize:12];
        _clicksLB.textColor = [UIColor lightGrayColor];
    }
    return _clicksLB;

}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.longTitleLB];
        [self.contentView addSubview:self.clicksLB];
        //图片 左10  宽高92 70  横向居中
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(92);
            make.height.mas_equalTo(70);
            make.centerY.mas_equalTo(0);
        }];
        //题目 距图片右边缘 8   右边缘 10像素 上边缘比图片上边缘低了3像素
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.iconView.mas_topMargin).mas_equalTo(3);
        }];
        //长题目 左右边缘和题目一样  上边缘距离题目下边 8像素
        [self.longTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLB.mas_leftMargin);
            make.rightMargin.mas_equalTo(self.titleLB.mas_rightMargin);
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(8);
        }];
        //浏览数   下边缘和图片对齐  右边和title对齐
        [self.clicksLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
           // make.width.mas_equalTo(50);
        }];
    }
    return self;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
