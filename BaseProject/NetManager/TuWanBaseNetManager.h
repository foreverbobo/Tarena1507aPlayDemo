//
//  TuWanBaseNetManager.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/3.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanBaseModel.h"
typedef NS_ENUM(NSUInteger, TuWanListType) {
    TuWanListTypeToutiao,
    TuWanListTypeDujia,
    TuWanListTypeAnhei3,
    TuWanListTypeMoshou,
    TuWanListTypeFengbao,
    TuWanListTypeLushi,
    TuWanListTypeXingji2,
    TuWanListTypeShouwang,
    TuWanListTypeHuanhua,
    TuWanListTypeQuwen,
    TuWanListTypeCos,
    TuWanListTypeMeinv,
    TuWanListTypePicture,
    TuWanListTypeVideo,
    TuWanListTypeGuide
};
@interface TuWanBaseNetManager : BaseNetManager
+(id)getListWithType:(TuWanListType)type start:(NSInteger)start completionHandle:(void(^)(TuWanBaseModel *model,NSError *error))completionHandle;
@end
