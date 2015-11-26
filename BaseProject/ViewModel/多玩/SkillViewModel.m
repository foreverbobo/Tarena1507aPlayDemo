//
//  SkillViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "SkillViewModel.h"

@implementation SkillViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getListWithType:DuoWanListSkillArray completionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(SkillDataModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)nameForRow:(NSInteger)row
{
    return [self modelForRow:row].name;
}
-(NSString *)idForRow:(NSInteger)row
{
    return [self modelForRow:row].identify;
}
-(NSString *)levelForRow:(NSInteger)row
{
    return [self modelForRow:row].level;
}
-(NSString *)cooldownForRow:(NSInteger)row
{
    return [self modelForRow:row].cooldown;
}
-(NSString *)desForRow:(NSInteger)row
{
    return [self modelForRow:row].des;
}
-(NSString *)strongForRow:(NSInteger)row
{
    return [self modelForRow:row].strong;
}
-(NSString *)tipsForRow:(NSInteger)row
{
    return [self modelForRow:row].tips;
}
-(NSDictionary *)dataDicForRow:(NSInteger)row
{
    SkillDataModel *model = [self modelForRow:row];
    return @{@"name":model.name,@"identify":model.identify,@"level":model.level,@"cooldown":model.cooldown,@"des":model.des,@"strong":model.strong,@"tips":model.tips};
}
@end
