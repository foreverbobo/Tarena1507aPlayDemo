//
//  HeroListViewController.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroViewModel.h"
@interface HeroListViewController : UIViewController
@property (nonatomic,assign)HeroType type;
/** initWithType的初始化 */
-(instancetype)initWithHeroType:(HeroType)type;
@end
