//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/3.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanFreeHero.h"//免费英雄
#import "DuoWanAllHeroModel.h"//全部英雄
#import "DuoWanBaiKeListModel.h"//游戏百科11
#import "DuoWanBestGroup.h"//最佳阵容11
#import "DuoWanEquipListModel.h"//装备列表11
#import "DuoWanEquipModel.h"//分类装备列表
#import "DuoWanEquipPropetyModel.h"//装备属性
#import "DuoWanGiftModel.h"//天赋详情
#import "DuoWanSkillModel.h"//召唤师技能11
#import "DuoWanTallyModel.h"//符文详情
#import "DuoWanWeekDataModel.h"//一周详情
typedef NS_ENUM(NSUInteger, DuoWanList) {
    DuoWanListFree,
    DuoWanListAll,
    DuoWanListBaiKeArray,
    DuoWanListBestGroupArray,
    DuoWanListEquipListArray,
    DuoWanListGift,
    DuoWanListSkillArray,
    DuoWanListTally,
};


#import "DuoWanHeroSkinModel.h"//英雄皮肤 11
#import "DuowanHeroVoiceModel.h"//英雄配音 11
#import "DuoWanHeroMediaModel.h"//英雄视频 11
#import "DuoWanHeroEquipModel.h"//英雄出装 11
#import "DuoWanHeroMaterialModel.h"//英雄资料
#import "DuoWanHeroFuwenDaPeiModel.h"//英雄符文搭配11
#import "DuoWanHeroChangeModel.h"//英雄改动

typedef NS_ENUM(NSUInteger, DuoWanHeroList) {
    DuoWanHeroListSkinArray,
    DuoWanHeroListVoiceArray,
    DuoWanHeroListEquipArray,
    DuoWanHeroListMaterial,
    DuoWanHeroListFuwenDapeiArray,
    DuoWanHeroListChange
};






@interface DuoWanNetManager : BaseNetManager

//根据type属性去确定请求的参数  type属性带Array 则在接收数据的时候 用NSArray接收
/**
 *  获取有关英雄的数据
 *
 *  @param type             枚举类型
 *  @param hero             英雄名字
 *  @param completionHandle 闭包处理
 *
 *  @return 网络请求任务
 */
+(id)getDataWithType:(DuoWanHeroList)type Hero:(NSString *)hero completionHandle:(void(^)(id model,NSError *error))completionHandle;

/**
 *  获取无英雄相关的列表
 *
 *  @param type             枚举类型
 *  @param completionHandle 闭包处理
 *
 *  @return 网络请求任务
 */
+(id)getListWithType:(DuoWanList)type completionHandle:(void(^)(id model,NSError *error))completionHandle;



/**
 *  获取英雄的周数据情况
 *
 *  @param heroId           英雄的id
 *  @param completionHandle 闭包处理
 *
 *  @return 网络请求数据
 */
+(id)getWeekDataWith:(NSInteger)heroId completionHandl:(void(^)(DuoWanWeekDataModel *model,NSError *error))completionHandle;
/**
 *  获取分类装备数据
 *
 *  @param tag              分类名字
 *  @param completionHandle 闭包处理
 *
 *  @return 网络请求
 */
+(id)getEquipWithTag:(NSString *)tag completionHandl:(void(^)(NSArray *model,NSError *error))completionHandle;
/**
 *  获取某装备详细数据
 *
 *  @param Id               装备id
 *  @param completionHandle 闭包处理
 *
 *  @return 网络请求
 */
+(id)getEquipPreopetyWithId:(NSInteger)Id completionHandl:(void(^)(DuoWanEquipPropetyModel *model,NSError *error))completionHandle;

/**
 *  获取视频数据 分页属性
 *
 *  @param page             每页页数
 *  @param hero             英雄名字
 *  @param completionHandle 闭包处理
 *
 *  @return 网络请求
 */
+(id)getMediaDataArrayWithPage:(NSInteger)page Hero:(NSString *)hero completionHandle:(void(^)(NSArray *model,NSError *error))completionHandle;



@end
