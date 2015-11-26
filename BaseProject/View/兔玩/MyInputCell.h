//
//  MyInputCell.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/14.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyInputCell;

@protocol MyInputCellDelegate <NSObject>
- (void)clickNextItemInMyInputCellCell:(MyInputCell *)cell;
@end
@interface MyInputCell : UITableViewCell
@property (nonatomic,strong)UITextField *textfield;
//协议使用内存管理关键词：weak
@property(nonatomic, weak) id<MyInputCellDelegate> delegate;
@end
