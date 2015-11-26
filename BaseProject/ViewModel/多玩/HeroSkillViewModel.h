//
//  HeroSkillViewModel.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface HeroSkillViewModel : BaseViewModel
@property (nonatomic,strong)DuoWanHeroMaterialModel *materiaModel;
-(NSArray *)skillNameArray;
-(NSString *)nameForIndex:(NSInteger)index;
-(NSString *)descForIndex:(NSInteger)index;
-(NSString *)costForIndex:(NSInteger)index;
-(NSString *)cooldownForIndex:(NSInteger)index;
-(NSString *)rangeForIndex:(NSInteger)index;
-(NSString *)effectForIndex:(NSInteger)index;
@property (nonatomic,strong)NSArray *likeHeroArray;
@property (nonatomic,strong)NSArray *hateHeroArray;
-(NSString *)likeNameForRow:(NSInteger)row;
-(NSString *)hateNameForRow:(NSInteger)row;
-(NSString *)likeDescForRow:(NSInteger)row;
-(NSString *)hateDescForRow:(NSInteger)row;


@property (nonatomic,strong)NSString *heroName;
-(instancetype)initWithHeroName:(NSString *)heroName;
@end
