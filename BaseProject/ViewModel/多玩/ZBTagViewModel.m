//
//  ZBTagViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "ZBTagViewModel.h"

@implementation ZBTagViewModel
-(id)initWithTag:(NSString *)tag
{
    if(self = [super init])
    {
        self.tag = tag;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getEquipWithTag:self.tag completionHandl:^(NSArray *model, NSError *error) {
        self.dataArr = [model mutableCopy];
        completionHandle(error);
    }];
}
-(EquipDataModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(NSInteger)idforRow:(NSInteger)row
{
    return [self modelForRow: row].identify;
}
-(NSString *)textForRow:(NSInteger)row
{
    return [self modelForRow:row].text;
}
@end
