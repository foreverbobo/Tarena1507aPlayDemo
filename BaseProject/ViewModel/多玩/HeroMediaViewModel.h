//
//  HeroMediaViewModel.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface HeroMediaViewModel : BaseViewModel
@property (nonatomic,assign)NSInteger rowNumber;
-(NSURL *)picUrlForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)videoLengthForRow:(NSInteger)row;
-(NSString *)updateForRow:(NSInteger)row;

@property (nonatomic,strong)NSString *heroName;
@property (nonatomic,assign)NSInteger page;
-(instancetype)initWithHeroName:(NSString *)heroName;

@end
