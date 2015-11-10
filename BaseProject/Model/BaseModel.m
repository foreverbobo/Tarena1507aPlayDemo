//
//  BaseModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/10/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName": @"typename", @"ID": @"id", @"desc": @"description"};
}
@end
