//
//  DuoWanBestGoupViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanBestGoupViewModel.h"

@implementation DuoWanBestGoupViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getListWithType:DuoWanListBestGroupArray completionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];

}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(GroupDataModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSArray *)heroNamesForRow:(NSInteger)row
{
    GroupDataModel *model = [self modelForRow:row];
    return @[model.hero1,model.hero2,model.hero3,model.hero4,model.hero5];
}
-(NSArray *)heroDescForRow:(NSInteger)row
{
    GroupDataModel *model = [self modelForRow:row];
    return @[model.des1,model.des2,model.des3,model.des4,model.des5];
}
-(NSString *)descForRow:(NSInteger)row
{
    return [self modelForRow:row].des;
}
@end
