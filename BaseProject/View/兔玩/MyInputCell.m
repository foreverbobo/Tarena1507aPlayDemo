//
//  MyInputCell.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/14.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "MyInputCell.h"

@implementation MyInputCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.textfield];
        [self.textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(0);
        }];
        self.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    }
    return self;
}
- (UITextField *)textfield{
    if (!_textfield) {
        _textfield = [UITextField new];
        //键盘返回按钮的样式 为 下一项
        _textfield.returnKeyType = UIReturnKeyNext;
        //添加边框风格
        _textfield.borderStyle = UITextBorderStyleRoundedRect;
        [_textfield bk_addEventHandler:^(id sender) {
            //防御性编程，先判断_delegate中是否有某方法，在执行
            if ([_delegate respondsToSelector:@selector(clickNextItemInMyInputCellCell:)]) {
                [_delegate clickNextItemInMyInputCellCell:self];
            }
        } forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    return _textfield;
}

@end
