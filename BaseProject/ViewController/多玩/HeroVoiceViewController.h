//
//  HeroVoiceViewController.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroVoiceViewController : UIViewController
@property (nonatomic,strong)NSString *heroName;
-(instancetype)initWithHeroName:(NSString *)heroName;
@end
