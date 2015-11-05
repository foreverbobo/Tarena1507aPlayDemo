//
//  DuoWanViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface DuoWanViewModel : BaseViewModel
-(instancetype)initHeroListWithType:(DuoWanHeroList)type withHeroName:(NSString *)heroName;
-(instancetype)initListWithType:(DuoWanList)type;
-(instancetype)initWeekDataWithHeroId:(NSInteger)heroId;
-(instancetype)initWithEquipTag:(NSString *)equipTag;
-(instancetype)initWithEquipId:(NSInteger)equipId;
-(instancetype)initMediaDataWithPage:(NSInteger)page heroName:(NSString *)heroName;



@property (nonatomic,assign)NSInteger rowNumber;
@property (nonatomic,strong)NSString *heroName;
@property (nonatomic,assign)NSInteger heroId;
@property (nonatomic,assign)NSInteger page;
@property (nonatomic,strong)NSString *equipTag;
@property (nonatomic,assign)NSInteger equipId;
@property (nonatomic,assign)DuoWanList listType;
@property (nonatomic,assign)DuoWanHeroList heroListType;

-(void)getListDataWithCompletionHandle:(CompletionHandle)completionHandle;
-(void)getHeroListDataWithCompletionHandle:(CompletionHandle)completionHandle;
-(void)getWeekDataWithCompletionHandle:(CompletionHandle)comletionHandle;
-(void)getEquipTagDataWithCompletionHandle:(CompletionHandle)completionHandle;
-(void)getEquioIdDataithCompletionHandle:(CompletionHandle)completionHandle;
-(void)refreshMediaDataWithCompletionHandle:(CompletionHandle)completionHandle;
-(void)getMoreMediaWithCompletionHandle:(CompletionHandle)completionHandle;


@end
