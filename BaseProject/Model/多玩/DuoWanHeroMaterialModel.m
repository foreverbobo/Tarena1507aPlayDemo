//
//  DuoWanHeroMaterialModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanHeroMaterialModel.h"

@implementation DuoWanHeroMaterialModel



+ (NSDictionary *)objectClassInArray{
    return @{@"like" : [Like class], @"hate" : [Hate class]};
}
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"identify":@"id",@"desc":@"description"};
}
@end


@implementation SkillE
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"identify":@"id",@"desc":@"description"};
}
@end


@implementation SkillW

@end


@implementation SkillB

@end


@implementation SkillQ

@end


@implementation SkillR

@end


@implementation Like

@end


@implementation Hate

@end


