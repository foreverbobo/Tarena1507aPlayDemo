//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/6.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBImageView.h"
@interface TuWanImageCell : UITableViewCell
/** 题目标签 */
@property(nonatomic,strong) UILabel *titleLb;
/** 点击数标签 */
@property(nonatomic,strong) UILabel *clicksNumLb;
/** 图片1 */
@property(nonatomic,strong) WBImageView *iconIV0;
/** 图片2 */
@property(nonatomic,strong) WBImageView *iconIV1;
/** 图片3 */
@property(nonatomic,strong) WBImageView *iconIV2;

@end
