//
//  HeroDetailViewController.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailViewController : UIViewController
@property (nonatomic,strong)NSDictionary *heroInfoDic;
-(instancetype)initWithHeroInfoDic:(NSDictionary *)heroInfoDic;
@end
