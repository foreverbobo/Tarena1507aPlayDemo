//
//  HeroDetailCollectionViewCell.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroIconView.h"
@interface HeroDetailCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)HeroIconView *icon;
@property (nonatomic,strong)UILabel *titleLb;
@property (nonatomic,strong)UILabel *nameLb;
@property (nonatomic,strong)UILabel *locationLb;


@end
