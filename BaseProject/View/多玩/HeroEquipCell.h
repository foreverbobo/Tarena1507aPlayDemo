//
//  HeroEquipCell.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroIconView.h"
@interface HeroEquipCell : UITableViewCell
@property (nonatomic,strong)UILabel *titleLb;
@property (nonatomic,strong)UILabel *authorLb;
@property (nonatomic,strong)UILabel *combatLb;
@property (nonatomic,strong)NSArray *equipIdArr;



@end
