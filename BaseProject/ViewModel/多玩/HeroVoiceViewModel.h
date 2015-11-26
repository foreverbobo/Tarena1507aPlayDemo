//
//  HeroVoiceViewModel.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface HeroVoiceViewModel : BaseViewModel
@property (nonatomic,assign)NSInteger rowNumber;
-(NSString *)titleForRow:(NSInteger)row;


@property (nonatomic,strong)NSString *heroName;
-(instancetype)initWithHeroName:(NSString *)heroName;
@end
