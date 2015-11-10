//
//  heroziliao.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "heroziliao.h"

@implementation heroziliao
+(id)getDataWithCompletionHandle:(void(^)(DuoWanHeroMaterialModel *model,NSError *error))completionHandle
{
    NSString *path = @"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS9.1&heroName=Braum&v=140";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
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

}
@end
