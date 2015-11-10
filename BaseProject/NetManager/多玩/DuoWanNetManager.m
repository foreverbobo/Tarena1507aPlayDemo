//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/3.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanNetManager.h"

@implementation DuoWanNetManager
+(id)getDataWithType:(DuoWanHeroList)type Hero:(NSString *)hero completionHandle:(void(^)(id ,NSError *))completionHandle
{
    NSString *path = nil;
    id task = nil;
    switch (type) {
        case DuoWanHeroListSkinArray: {
            path = [NSString stringWithFormat:@"http://box.dwstatic.com/apiHeroSkin.php?hero=%@&v=140&OSType=iOS9.1&versionName=2.4.0",hero];
           
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSArray *model = [Duowanheroskinarray mj_objectArrayWithKeyValuesArray:responseObj];
                completionHandle(model,error);
                //NSLog(@"%@",responseObj);
            }];
            break;
        }
        case DuoWanHeroListVoiceArray: {
            path = [NSString stringWithFormat:@"http://box.dwstatic.com/apiHeroSound.php?hero=%@&v=140&OSType=iOS9.1&versionName=2.4.0",hero];
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSArray *model = [NSString mj_objectArrayWithKeyValuesArray:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
        case DuoWanHeroListEquipArray: {
            path = [NSString stringWithFormat:@"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php?v=140&OSType=iOS9.1&championName=%@&limit=7",hero];
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSArray *model = [EquipModel mj_objectArrayWithKeyValuesArray:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
        case DuoWanHeroListMaterial: {
            path = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS9.1&heroName=%@&v=140",hero];
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSString *name = responseObj[@"name"];
                NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:responseObj];//[responseObj copy];
                
                NSArray *arrar = @[@"_Q",@"_W",@"_E",@"_R",@"_B"];
                NSArray *skillArr = @[@"SkillQ",@"SkillW",@"SkillE",@"SkillR",@"SkillB"];
                for (int i = 0; i < arrar.count; i++) {
                    NSString *skill = [NSString stringWithFormat:@"%@%@",name,arrar[i]];
                    NSString *string = skillArr[i];
                    id data = responseObj[skill];
                    mutDic[string] = data;
                }
                completionHandle([DuoWanHeroMaterialModel mj_objectWithKeyValues:[mutDic copy]],error);
            }];
            break;
        }
        case DuoWanHeroListFuwenDapeiArray: {
            path = [NSString stringWithFormat:@"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php?hero=%@&v=140&OSType=iOS9.1",hero];
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSArray *model = [FuwendapeiModel mj_objectArrayWithKeyValuesArray:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
        case DuoWanHeroListChange: {
            path = [NSString stringWithFormat:@"http://db.duowan.com/boxnews/heroinfo.php?name=%@&v=140&OSType=iOS9.1",hero];
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([DuoWanHeroChangeModel mj_objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        default: {
            break;
        }
    }
    return task;
}
+(id)getListWithType:(DuoWanList)type completionHandle:(void(^)(id ,NSError *))completionHandle
{
    NSString *path = nil;
    id task = nil;
    switch (type) {
        case DuoWanListFree: {
            path = @"http://lolbox.duowan.com/phone/apiHeroes.php?type=free&v=140&OSType=iOS9.1";
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([DuoWanFreeHero mj_objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case DuoWanListAll: {
            path = @"http://lolbox.duowan.com/phone/apiHeroes.php?type=all&v=140&OSType=iOS9.1";
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                DuoWanAllHeroModel *model = [DuoWanAllHeroModel mj_objectWithKeyValues:responseObj];

                completionHandle(model,error);
            }];
            break;
        }
        case DuoWanListBaiKeArray: {
            path = @"http://box.dwstatic.com/apiToolMenu.php?category=database&v=140&OSType=iOS9.1&versionName=2.4.0";
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSArray *model = [BaikeListArrayDataModel mj_objectArrayWithKeyValuesArray:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
        case DuoWanListBestGroupArray: {
            path = @"http://box.dwstatic.com/apiHeroBestGroup.php?v=140&OSType=iOS9.1";
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSArray *model = [GroupDataModel mj_objectArrayWithKeyValuesArray:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
        case DuoWanListEquipListArray: {
            path = @"http://lolbox.duowan.com/phone/apiZBCategory.php?v=140&OSType=iOS9.1&versionName=2.4.0";
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSArray *model = [EquipArrayDataModel mj_objectArrayWithKeyValuesArray:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
       
        case DuoWanListGift: {
            path = @"http://lolbox.duowan.com/phone/apiGift.php?v=140&OSType=iOS9.1";
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
              //  NSLog(@"%@",responseObj);
                DuoWanGiftModel *model = [DuoWanGiftModel mj_objectWithKeyValues:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
        case DuoWanListSkillArray: {
            path = @"http://lolbox.duowan.com/phone/apiSumAbility.php?v=140&OSType=iOS9.1";
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                NSArray *model = [SkillDataModel mj_objectArrayWithKeyValuesArray:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
        case DuoWanListTally: {
            path = @"http://lolbox.duowan.com/phone/apiRunes.php?v=140&OSType=iOS9.1";
            task = [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                DuoWanTallyModel *model = [DuoWanTallyModel mj_objectWithKeyValues:responseObj];
                completionHandle(model,error);
            }];
            break;
        }
        default: {
            break;
        }
    }
    
    
    
    return task;

}
+(id)getEquipWithTag:(NSString *)tag completionHandl:(void (^)(NSArray *, NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@&v=140&OSType=iOS9.1&versionName=2.4.0",tag];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        NSArray *model = [EquipDataModel mj_objectArrayWithKeyValuesArray:responseObj];
        completionHandle(model,error);
    }];

}
+(id)getEquipPreopetyWithId:(NSInteger)Id completionHandl:(void (^)(DuoWanEquipPropetyModel *, NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiItemDetail.php?id=%ld&v=140&OSType=iOS9.1",Id];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        DuoWanEquipPropetyModel *model = [DuoWanEquipPropetyModel mj_objectWithKeyValues:responseObj];
        completionHandle(model,error);
    }];
}
+(id)getWeekDataWith:(NSInteger)heroId completionHandl:(void(^)(DuoWanWeekDataModel *,NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:@"http://183.61.12.108/apiHeroWeekData.php?heroId=%ld",heroId];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuoWanWeekDataModel mj_objectWithKeyValues:responseObj],error);
    }];
}
+(id)getMediaDataArrayWithPage:(NSInteger)page Hero:(NSString *)hero completionHandle:(void(^)(NSArray * ,NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:@"http://box.dwstatic.com/apiVideoesNormalDuowan.php?action=l&p=%ld&v=140&OSType=iOS9.1&tag=%@&src=letv",page,hero];
    return  [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        NSArray *model = [Duowanheroskinarray mj_objectArrayWithKeyValuesArray:responseObj];
        completionHandle(model,error);
    }];

}

@end
