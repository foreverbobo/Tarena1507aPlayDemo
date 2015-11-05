//
//  DuoWanSkillModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanSkillModel.h"

@implementation DuoWanSkillModel


+ (NSDictionary *)objectClassInArray{
    return @{@"skillArray" : [SkillDataModel class]};
}
@end
@implementation SkillDataModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"identify":@"id"};
}
@end


