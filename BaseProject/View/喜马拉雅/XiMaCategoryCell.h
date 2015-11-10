//
//  XiMaCategoryCell.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBImageView.h"
@interface XiMaCategoryCell : UITableViewCell
/** 序号标签 */
@property (nonatomic,strong)UILabel *orderLB;
/** 类型图片 */
@property (nonatomic,strong)WBImageView *iconIV;
/** 类型名称 */
@property (nonatomic,strong)UILabel *titleLB;
/** 类型描述 */
@property (nonatomic,strong)UILabel *descLB;
/** 集数 */
@property (nonatomic,strong)UILabel *numberLB;
/** 集数图标 */
@property (nonatomic,strong)WBImageView *numberIcon;


@end
