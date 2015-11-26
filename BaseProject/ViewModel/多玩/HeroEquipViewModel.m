//
//  HeroEquipViewModel.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroEquipViewModel.h"

@implementation HeroEquipViewModel
-(instancetype)initWithHeroName:(NSString *)heroName
{
    if(self = [super init])
    {
        self.heroName = heroName;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [self.dataArr removeAllObjects];
    self.dataTask = [DuoWanNetManager getDataWithType:DuoWanHeroListEquipArray Hero:self.heroName completionHandle:^(id model, NSError *error) {
        [self.dataArr addObjectsFromArray:model];
        completionHandle(error);
    }];
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(EquipModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSString *)authorForRow:(NSInteger)row
{
    return [self modelForRow:row].author;
}
-(NSString *)combatForRow:(NSInteger)row
{
    return [self modelForRow:row].combat;
}
-(NSArray *)equipIdArrayForRow:(NSInteger)row
{
    NSString *equipIdArr = [self modelForRow:row].end_cz;
    return [equipIdArr componentsSeparatedByString:@","];

}
@end
