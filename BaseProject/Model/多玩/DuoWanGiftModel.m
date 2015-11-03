//
//  DuoWanGiftModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanGiftModel.h"

@implementation DuoWanGiftModel


+ (NSDictionary *)objectClassInArray{
    return @{@"a" : [Attack class], @"d" : [Defence class], @"g" : [Useul class]};
}
@end
@implementation Attack
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"identify":@"id"};
}
@end


@implementation Defence

@end


@implementation Useul

@end


