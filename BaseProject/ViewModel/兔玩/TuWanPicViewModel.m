//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanPicViewModel.h"

@implementation TuWanPicViewModel
-(id)initWithAid:(NSString *)aid
{
    if(self = [super init])
    {
        self.aid = aid;
    }
    return self;

}
-(instancetype)init
{
    if(self = [super init])
    {
        NSAssert1(NO, @"%s 必须使用initWithAid初始化", __func__);
    }
    return self;
}
-(NSInteger)picNumber
{
    return self.imageUrls.count;
}
-(NSURL *)urlWithIndex:(NSInteger)index
{
    return self.imageUrls[index];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [TuWanBaseNetManager getPicDetailWithId:self.aid completionHandle:^(NSArray *model, NSError *error) {
        NSMutableArray *array = [NSMutableArray new];
        TuWanPicModel *picModel = model.firstObject;
        for (TuWanPicContentModel *content in picModel.content) {
            NSURL *url = [NSURL URLWithString:content.pic];
            [array addObject:url];
        }
        self.imageUrls = [array copy];
        completionHandle(error);
    }];

}

@end
