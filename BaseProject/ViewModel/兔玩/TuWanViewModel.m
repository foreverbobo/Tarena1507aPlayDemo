//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel

#pragma mark -- 初始化
-(instancetype)initWithType:(TuWanListType)type
{
    if(self = [super init])
    {
        _type = type;
    }
    return self;
}
//预防性编程  防止没使用initType初始化
-(instancetype)init
{
    if(self = [super init])
    {
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}

#pragma mark -- 数据返回
-(BOOL)isExistIndexPic
{
    return self.indexPicArr != nil && self.indexPicArr.count != 0;
}
-(TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row
{
    return arr[row];
}
-(TuWanDataListModel *)listModelForArr:(NSArray *)arr row:(NSInteger)row
{
    return arr[row];
}

/** 根据showtype  0 为没图   1为有图 */
-(BOOL)containImages:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].showtype integerValue];
}




/** 返回列表中某行数据的题目 */
-(NSString *)titleForRowInList:(NSInteger)row
{
    return [self listModelForArr:self.dataArr row:row].title;
}
/** 返回列表中某行数据的图片 */
-(NSURL *)iconUrlForRowInList:(NSInteger)row
{
    NSString *path = [self listModelForArr:self.dataArr row:row].litpic;
    return [NSURL URLWithString:path];
}
/** 返回列表中某行数据的描述 */
-(NSString *)descForRowInList:(NSInteger)row
{
    return [self listModelForArr:self.dataArr row:row].longtitle;
}
/** 返回列表中某行数据的浏览人数 */
-(NSString *)clicksForRowInList:(NSInteger)row
{
    return [self listModelForArr:self.dataArr row:row].click;
}
-(NSURL *)htmlURLForRowInList:(NSInteger)row
{
    NSString *path = [self listModelForArr:self.dataArr row:row].html5;
    return [NSURL URLWithString:path];
}

-(NSInteger)headNumber
{
    return self.indexPicArr.count;
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
/** 滚动展示栏的图片 */
-(NSURL *)headerImageUrlWithRowInIndexPic:(NSInteger)row
{
    NSString *path = [self modelForArr:self.indexPicArr row:row].litpic;
    return [NSURL URLWithString:path];
}
/** 滚动展示栏的文字 */
-(NSString *)titleForRowInIndexPic:(NSInteger)row
{
    return [self modelForArr:self.indexPicArr row:row].title;
}
-(NSURL *)htmlURLForRowInIndexPic:(NSInteger)row
{
    NSString *path = [self modelForArr:self.indexPicArr row:row].html5;
    return [NSURL URLWithString:path];
}

#pragma mark -- 网络请求
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(NSURL *)indexPicURLInArrarWithIndex:(NSInteger)index WithRow:(NSInteger)row
{
    TuWanDataListModel *listModel = self.dataArr[row];
    TuwanDataListShowItemModel *showItemModel = listModel.showitem[index];
    NSString *path = showItemModel.pic;
    return [NSURL URLWithString:path];

}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [TuWanBaseNetManager getListWithType:self.type start:self.start completionHandle:^(TuWanBaseModel *model, NSError *error) {
        if (self.start == 0) {
            [self.dataArr removeAllObjects];
            self.indexPicArr = nil;
            
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        self.indexPicArr = model.data.indexpic;
        completionHandle(error);
    }];
}
@end
