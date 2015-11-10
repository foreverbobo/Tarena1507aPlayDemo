//
//  XiMaViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "XiMaViewModel.h"

@implementation XiMaViewModel
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if(self.maxPage <= self.page)
    {
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据"}];
        
        completionHandle(error);
        return;
    }
    self.page ++;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [XiMaNetManager getRankListWithPageId:self.page completionHandle:^(RankingListModel *model, NSError *error) {
        
        if(!error)
        {
            if(self.page == 1)
            {
                [self.dataArr removeAllObjects];
            }
            self.maxPage = model.maxPageId;
            [self.dataArr addObjectsFromArray:model.list];
        }
        completionHandle(error);
    }];
}
-(RankListListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSInteger)albumIdForRow:(NSInteger)row
{
    return [self modelForRow:row].albumId;
}
-(NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSString *)descForRow:(NSInteger)row
{
    return [self modelForRow:row].intro;
}
-(NSString *)numberForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"%ld集",[self modelForRow:row].tracks];
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
@end
