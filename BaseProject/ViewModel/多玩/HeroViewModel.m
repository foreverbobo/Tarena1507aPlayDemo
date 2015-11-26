//
//  HeroViewModel.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroViewModel.h"



@implementation HeroViewModel
static NSArray *_heroArray = nil;
-(instancetype)initWithHeroType:(HeroType)type
{
    if(self = [super init])
    {
        self.type = type;
    }
    return self;

}
/** 因为不需要加载更多 则这里使用getData的网络请求方法 */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    
    [self.dataArr removeAllObjects];
    switch (self.type) {
        case HeroTypeFree: {
            self.dataTask = [DuoWanNetManager getListWithType:DuoWanListFree completionHandle:^(id model, NSError *error) {
                DuoWanFreeHero *models = model;
                [self.dataArr addObjectsFromArray:models.free];
                completionHandle(error);
            }];
            break;
        }
        case HeroTypeAll: {
            self.dataTask = [DuoWanNetManager getListWithType:DuoWanListAll completionHandle:^(id model, NSError *error) {
                DuoWanAllHeroModel *models = model;
                [self.dataArr addObjectsFromArray:models.all];
                completionHandle(error);
            }];
            break;
        }
        default: {
            break;
        }
    }
    _heroArray = [self.dataArr copy];
}
/** 因为英雄详情的model是一样的  所以 我们可以用一样的model去获得数组中的英雄对象 */
-(DuoWanFreeHeroModel *)modelForRow:(NSInteger)row
{
    DuoWanFreeHeroModel *model = self.dataArr[row];
    return model;
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
/** 获取标题 */
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
/** 获取中文名字 */
-(NSString *)cnNameForRow:(NSInteger)row
{
    return [self modelForRow:row].cnName;
}
/** 获取英文名字 */
-(NSString *)enNameForRow:(NSInteger)row
{
    return [self modelForRow:row].enName;
}
/** 获取对位位置 */
-(NSString *)locationForRow:(NSInteger)row
{
    return [self modelForRow:row].location;
}
/** 获取英雄信息字典 */
-(NSDictionary *)heroInfoDicForRow:(NSInteger)row
{
    /**
    "enName": "Kindred",
     "cnName": "千珏",
     "title": "永猎双子",
     "tags": "marksman",
     "rating": "8,2,2,4",
     "location": "打野",
     "price": "6300,4500"
     */
    NSMutableDictionary *dic = [NSMutableDictionary new];
    DuoWanFreeHeroModel *model = [self modelForRow:row];
    [dic setValue:model.enName forKey:@"enName"];
    [dic setValue:model.cnName forKey:@"cnName"];
    [dic setValue:model.title forKey:@"title"];
    [dic setValue:model.tags forKey:@"tags"];
    [dic setValue:model.rating forKey:@"rating"];
    [dic setValue:model.location forKey:@"location"];
    [dic setValue:model.price forKey:@"price"];
    
    return [dic copy];
}

@end
