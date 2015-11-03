//
//  DuoWanHeroSkinModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanHeroSkinModel.h"

@implementation DuoWanHeroSkinModel


+ (NSDictionary *)objectClassInArray{
    
    return @{@"duoWanHeroSkinArray" : [Duowanheroskinarray class]};
    
}
@end
@implementation Duowanheroskinarray
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"identify":@"id"};
}
@end


