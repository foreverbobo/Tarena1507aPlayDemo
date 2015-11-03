//
//  DuoWanWeekDataModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/3.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanWeekDataModel.h"

@implementation DuoWanWeekDataModel

@end
@implementation WeekDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"charts" : [WeekDataChartsModel class]};
}

@end


@implementation WeekDataChartsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ratio_data" : [WeekDataRatioData class]};
}

@end


@implementation WeekDataRatioData

@end


