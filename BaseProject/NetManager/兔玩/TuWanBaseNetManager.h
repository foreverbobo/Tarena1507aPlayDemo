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
    TuWanListTypePicture,
    TuWanListTypeVideo,
    TuWanListTypeGuide,
    TuWanListTypeQuwen,
    TuWanListTypeCos,
    TuWanListTypeMeinv
    
};
@interface TuWanBaseNetManager : BaseNetManager
/**
 *  通过type的枚举值去获取相对应的网络json数据
 *
 *  @param type             枚举类型
 *  @param start            数据的起始值
 *  @param completionHandle 闭包处理
 *
 *  @return 网络请求任务
 */
+(id)getListWithType:(TuWanListType)type start:(NSInteger)start completionHandle:(void(^)(TuWanBaseModel *model,NSError *error))completionHandle;
@end
