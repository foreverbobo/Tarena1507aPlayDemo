//
//  HeroMediaViewModel.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroMediaViewModel.h"

@implementation HeroMediaViewModel
-(instancetype)initWithHeroName:(NSString *)heroName
{
    if(self = [super init])
    {
        self.heroName = heroName;
    }
    return self;
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.page++;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getMediaDataArrayWithPage:self.page Hero:self.heroName completionHandle:^(NSArray *model, NSError *error) {
        if(self.page == 1)
        {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model];
        completionHandle(error);
    }];
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(DuoWanHeroMediaDataModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSURL *)picUrlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].cover_url];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSString *)videoLengthForRow:(NSInteger)row
{
    NSInteger time = [self modelForRow:row].video_length;
    NSInteger hour = time/3600;
    time = time - hour * 3600;
    NSInteger min = time/60;
    NSInteger sec = time%60;
    return [NSString stringWithFormat:@"%ld:%ld:%ld",hour,min,sec];
}
-(NSString *)updateForRow:(NSInteger)row
{
    NSString *updateTime = [self modelForRow:row].upload_time;
    NSArray *array1 = [updateTime componentsSeparatedByString:@" "];
    return array1[0];
}
@end
