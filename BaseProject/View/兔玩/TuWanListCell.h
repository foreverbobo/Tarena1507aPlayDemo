//
//  TuWanListCell.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/6.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBImageView.h"
@interface TuWanListCell : UITableViewCell
/** 左侧图片 */
@property (nonatomic,strong)WBImageView *iconView;
/** 题目标签 */
@property (nonatomic,strong)UILabel *titleLB;

/** 长题目标签 */
@property (nonatomic,strong)UILabel *longTitleLB;

/** 点击数标签 */
@property (nonatomic,strong)UILabel *clicksLB;

@end
