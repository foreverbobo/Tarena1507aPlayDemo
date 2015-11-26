//
//  ZBListViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "ZBListViewModel.h"

@implementation ZBListViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getListWithType:DuoWanListEquipListArray completionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}
-(EquipArrayDataModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].text;
}
-(NSString *)tagForRow:(NSInteger)row
{
    return [self modelForRow:row].tag;
}
@end
