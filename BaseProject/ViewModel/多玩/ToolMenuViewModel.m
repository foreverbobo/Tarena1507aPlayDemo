//
//  ToolMenuViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "ToolMenuViewModel.h"

@implementation ToolMenuViewModel
/** 不是分页，只实现getData即可 */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getListWithType:DuoWanListBaiKeArray completionHandle:^(id model, NSError *error) {
        [self.dataArr addObjectsFromArray:model];
        completionHandle(error);
    }];

}
-(BaikeListArrayDataModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
/** 返回的tag值 */
-(NSString *)tagForRow:(NSInteger)row
{
    return [self modelForRow:row].tag;
}
/** 返回的iconUrl */
-(NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].icon];
}
/** 返回的name */
-(NSString *)nameURLForRow:(NSInteger)row
{
    return [self modelForRow:row].name;
}
/** 返回的type值 */
-(ToolMenuType)typeForRow:(NSInteger)row
{
    if([[self modelForRow:row].type isEqualToString:@"web"])
    {
        return ToolMenuTypeWeb;
    }
    else
    {
        return ToolMenuTypeNative;
    }
}
/** 返回的url值 */
-(NSURL *)urlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].url];

}

@end
