//
//  XiMaAlbumViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "XiMaAlbumViewModel.h"

@implementation XiMaAlbumViewModel
-(id)initWithAlbumID:(NSInteger)albumID
{
    if(self = [super init])
    {
        self.albumID = albumID;
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
    self.page ++;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [XiMaNetManager getAlbumWithId:self.albumID page:self.page completionHandle:^(id model, NSError *error) {
        if(self.page == 1)
        {
            [self.dataArr removeAllObjects];
        }
        AlbumModel *models = model;
        [self.dataArr addObjectsFromArray:models.tracks.list];
        completionHandle(error);
    }];

}
-(AlbumTracksListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
/** 图标url */
-(NSURL *)iconUrlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].coverSmall];
}
/** 题目 */
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
/** 所属专辑名 */
-(NSString *)nickTitleForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"by %@",[self modelForRow:row].nickname];
}
/** 喜欢个数 */
-(NSInteger)likeNumberForRow:(NSInteger)row
{
    return [self modelForRow:row].likes;
}
/** 播放次数 */
-(NSInteger)playtimesNumberForRow:(NSInteger)row
{
    return [self modelForRow:row].playtimes;
}
/** 评论次数 */
-(NSInteger)commentsForRow:(NSInteger)row
{
    return [self modelForRow:row].comments;
}
/** 播放时长 */
-(NSString *)durationForRow:(NSInteger)row
{
    NSInteger time = [self modelForRow:row].duration;
    return [NSString stringWithFormat:@"%02ld:%02ld",time/60,time%60];
}
/** 更新时间 */
-(NSString *)updateForRow:(NSInteger)row
{
    NSInteger time = [self modelForRow:row].createdAt;
    NSInteger nowTime = [[NSDate date]timeIntervalSince1970];
    NSInteger result = nowTime - time;
    if(result/86400 > 1)
    {
        return [NSString stringWithFormat:@"%ld天前",result/86400];
    }
    else
    {
        return [NSString stringWithFormat:@"%ld小时前",result/3600];
    }
}
@end
