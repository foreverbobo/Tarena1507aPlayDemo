//
//  DuoWanEquipModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanEquipModel.h"

@implementation DuoWanEquipModel


+ (NSDictionary *)objectClassInArray{
    return @{@"equipArray" : [EquipDataModel class]};
}
@end


@implementation EquipDataModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"identify":@"id"};
}
@end


