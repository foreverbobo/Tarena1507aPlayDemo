//
//  HeroMediaCell.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBImageView.h"
@interface HeroMediaCell : UITableViewCell
@property (nonatomic,strong)WBImageView *imageV;
@property (nonatomic,strong)UILabel *titleLB;
@property (nonatomic,strong)UILabel *timeLB;
@property (nonatomic,strong)UILabel *updateLB;


@end
