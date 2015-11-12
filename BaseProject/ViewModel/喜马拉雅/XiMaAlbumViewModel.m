//
//  XiMaAlbumViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "XiMaAlbumViewModel.h"

@implementation XiMaAlbumViewModel
-(instancetype)initWithAlbumID:(NSInteger)albumID
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
    if([self isHasMore])
    {
        self.page ++;
        [self getDataFromNetCompleteHandle:completionHandle];
    }
    else
    {
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有加载内容了"}];
        completionHandle(error);
        return;
    
    }
    
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
        self.maxPage = models.tracks.maxPageId;
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
-(NSString *)likeNumberForRow:(NSInteger)row
{
    return @([self modelForRow:row].likes).stringValue ;
}
/** 播放次数 */
-(NSString *)playtimesNumberForRow:(NSInteger)row
{
    NSInteger count = [self modelForRow:row].playtimes;
    if(count < 10000)
    {
        return @([self modelForRow:row].playtimes).stringValue;
    }
    else
    {
        return [NSString stringWithFormat:@"%.1f万",count/10000.0];
    }
    
}
/** 评论次数 */
-(NSString *)commentsForRow:(NSInteger)row
{
    return @([self modelForRow:row].comments).stringValue;
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
    NSInteger time = [self modelForRow:row].createdAt/1000;
    NSInteger nowTime = [[NSDate date]timeIntervalSince1970];//[[NSDate date]timeIntervalSince1970];
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
/** 获取下载链接地址 */
-(NSURL *)downLoadUrlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].downloadUrl];
}
/** 获取某行音频播放地址 */
-(NSURL *)videoUrlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].playUrl64];
}
-(BOOL)isHasMore
{
    return self.maxPage > self.page;
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
@end
