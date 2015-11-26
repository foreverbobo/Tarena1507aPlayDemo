//
//  HeroSkillViewModel.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroSkillViewModel.h"

@implementation HeroSkillViewModel
-(instancetype)initWithHeroName:(NSString *)heroName
{
    if(self = [super init])
    {
        self.heroName = heroName;
    }
    return self;
}
-(NSArray *)skillNameArray
{
    NSArray *arrar = @[@"_B",@"_Q",@"_W",@"_E",@"_R"];
    NSMutableArray *skillArray = [NSMutableArray new];
    NSInteger count1 = arrar.count;
    for (int i = 0; i < count1 ; i++) {
        NSString *name = [NSString stringWithFormat:@"%@%@",self.heroName,arrar[i]];
        [skillArray addObject:name];
    }
    return [skillArray copy];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [self.dataArr removeAllObjects];
    self.dataTask = [DuoWanNetManager getDataWithType:DuoWanHeroListMaterial Hero:self.heroName completionHandle:^(id model, NSError *error) {
        self.materiaModel = model;
        [self.dataArr addObjectsFromArray:@[self.materiaModel.SkillB,self.materiaModel.SkillQ,self.materiaModel.SkillW,self.materiaModel.SkillE,self.materiaModel.SkillR]];
        self.likeHeroArray = self.materiaModel.like;
        self.hateHeroArray = self.materiaModel.hate;
        completionHandle(error);
    }];

}
-(Like *)modelWithArray:(NSArray *)array forRow:(NSInteger)row
{
    return array[row];
}
-(NSString *)likeNameForRow:(NSInteger)row
{
    return [self modelWithArray:self.likeHeroArray forRow:row].partner;
}
-(NSString *)hateNameForRow:(NSInteger)row
{
    return [self modelWithArray:self.hateHeroArray forRow:row].partner;
}
-(NSString *)likeDescForRow:(NSInteger)row
{
    return [self modelWithArray:self.likeHeroArray forRow:row].des;
}
-(NSString *)hateDescForRow:(NSInteger)row
{
    return [self modelWithArray:self.hateHeroArray forRow:row].des;
}
-(SkillR *)skillForIndex:(NSInteger)index
{
    return self.dataArr[index];
}
-(NSString *)nameForIndex:(NSInteger)index
{
    return ![[self skillForIndex:index].name isEqualToString:@""] ? [self skillForIndex:index].name:@"无";
}
-(NSString *)descForIndex:(NSInteger)index
{
    return ![[self skillForIndex:index].desc isEqualToString:@""] ? [self skillForIndex:index].desc:@"无";
}
-(NSString *)costForIndex:(NSInteger)index
{
    return ![[self skillForIndex:index].cost isEqualToString:@""] ? [self skillForIndex:index].cost:@"无";
}
-(NSString *)cooldownForIndex:(NSInteger)index
{
    return ![[self skillForIndex:index].cooldown isEqualToString:@""] ? [self skillForIndex:index].cooldown:@"无";
}
-(NSString *)rangeForIndex:(NSInteger)index
{
    return ![[self skillForIndex:index].range isEqualToString:@""] ? [self skillForIndex:index].range:@"无";
}
-(NSString *)effectForIndex:(NSInteger)index
{
    return ![[self skillForIndex:index].effect isEqualToString:@""] ? [self skillForIndex:index].effect:@"无";
}

@end
