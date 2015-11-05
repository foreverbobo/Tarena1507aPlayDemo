//
//  DuoWanViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanViewModel.h"
@interface DuoWanViewModel()
@property (nonatomic,strong)DuoWanTallyModel *tallyModel;
@property (nonatomic,strong)DuoWanGiftModel *giftModel;
@property (nonatomic,strong)DuoWanHeroMaterialModel *materiaModel;
@property (nonatomic,strong)DuoWanHeroChangeModel *changeModel;
@property (nonatomic,strong)WeekDataModel *weekModel;
@property (nonatomic,strong)DuoWanEquipPropetyModel *equipPropertyModel;
@end
@implementation DuoWanViewModel
#pragma mark -- VM初始化
-(instancetype)initHeroListWithType:(DuoWanHeroList)type withHeroName:(NSString *)heroName
{
    if(self = [super init])
    {
        _heroListType = type;
        _heroName = heroName;
    }
    return self;
}
-(instancetype)initListWithType:(DuoWanList)type
{
    if(self = [super init])
    {
        _listType = type;
    }
    return self;
}
-(instancetype)initWeekDataWithHeroId:(NSInteger)heroId
{
    if(self = [super init])
    {
        _heroId = heroId;
    }
    return self;
}
-(instancetype)initWithEquipTag:(NSString *)equipTag
{
    if(self = [super init])
    {
        _equipTag = equipTag;
    }
    return self;
}
-(instancetype)initWithEquipId:(NSInteger)equipId
{
    if(self = [super init])
    {
        _equipId = equipId;
    }
    return self;
}
-(instancetype)initMediaDataWithPage:(NSInteger)page heroName:(NSString *)heroName
{
    if(self = [super init])
    {
        _page = page;
        _heroName = heroName;
    }
    return self;
}
#pragma mark --无关英雄名的网络请求
-(void)getListDataWithCompletionHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getListWithType:self.listType completionHandle:^(id model, NSError *error) {
        [self.dataArr removeAllObjects];
        
        
        completionHandle(error);
        //根据type的不同，数据处理也不同
        switch (self.listType) {
            case DuoWanListFree: {
                
                DuoWanFreeHero *free = model;
                [self.dataArr addObjectsFromArray:free.free];
                break;
            }
            case DuoWanListAll: {
                DuoWanAllHeroModel *all = model;
                [self.dataArr addObjectsFromArray:all.all];
                break;
            }
            case DuoWanListBaiKeArray: {
                NSArray *array = model;
                [self.dataArr addObjectsFromArray:array];
                break;
            }
            case DuoWanListBestGroupArray: {
                NSArray *array = model;
                [self.dataArr addObjectsFromArray:array];
                break;
            }
            case DuoWanListEquipListArray: {
                NSArray *array = model;
                [self.dataArr addObjectsFromArray:array];
                break;
            }
            case DuoWanListGift: {
                self.giftModel = model;
                break;
            }
            case DuoWanListSkillArray: {
                NSArray *array = model;
                [self.dataArr addObjectsFromArray:array];
                break;
            }
            case DuoWanListTally: {
                self.tallyModel = model;
                break;
            }
            default: {
                break;
            }
        }
    }];
}
#pragma mark -- 有关英雄名的网络请求
-(void)getHeroListDataWithCompletionHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getDataWithType:self.heroListType Hero:self.heroName completionHandle:^(id model, NSError *error) {
        
        
        [self.dataArr removeAllObjects];
        
        completionHandle(error);
        //根据type的不同，数据处理也不同
        switch (self.heroListType) {
            case DuoWanHeroListSkinArray: {
                NSArray *array = model;
                [self.dataArr addObjectsFromArray:array];
                break;
            }
            case DuoWanHeroListVoiceArray: {
                NSArray *array = model;
                [self.dataArr addObjectsFromArray:array];
                break;
            }
            case DuoWanHeroListEquipArray: {
                NSArray *array = model;
                [self.dataArr addObjectsFromArray:array];
                break;
            }
            case DuoWanHeroListMaterial: {
                self.materiaModel = model;
                break;
            }
            case DuoWanHeroListFuwenDapeiArray: {
                NSArray *array = model;
                [self.dataArr addObjectsFromArray:array];
                break;
            }
            case DuoWanHeroListChange: {
                self.changeModel = model;
                break;
            }
            default: {
                break;
            }
        }
    }];

}
#pragma mark --  一周数据的网络请求
-(void)getWeekDataWithCompletionHandle:(CompletionHandle)comletionHandle
{
    self.dataTask = [DuoWanNetManager getWeekDataWith:self.heroId completionHandl:^(DuoWanWeekDataModel *model, NSError *error) {
        self.weekModel = model.data;
        comletionHandle(error);
    }];

}
#pragma mark -- 分类装备的网络请求
-(void)getEquipTagDataWithCompletionHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getEquipWithTag:self.equipTag completionHandl:^(NSArray *model, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model];
        completionHandle(error);
    }];
}
#pragma mark -- 装备详情的网络请求
-(void)getEquioIdDataithCompletionHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getEquipPreopetyWithId:self.equipId completionHandl:^(DuoWanEquipPropetyModel *model, NSError *error) {
        self.equipPropertyModel = model;
        completionHandle(error);
    }];
}
#pragma mark -- 英雄视频的网络请求
-(void)refreshMediaDataWithCompletionHandle:(CompletionHandle)completionHandle
{
    self.page = 1;
}
-(void)getMoreMediaWithCompletionHandle:(CompletionHandle)completionHandle
{
    self.page ++;
}
-(void)getMediaDataWithCompletionHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getMediaDataArrayWithPage:self.page Hero:self.heroName completionHandle:^(NSArray *model, NSError *error) {
        if(self.page == 1)
        {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model];
    }];
}
-(NSInteger )rowNumber
{
    return self.dataArr.count;
}
@end
