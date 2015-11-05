//
//  TuWanBaseModel.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanBaseModel.h"

@implementation TuWanBaseModel

@end


@implementation TuWanDataModel
+(NSDictionary *)objectClassInArray
{
    return @{@"indexpic":[TuWanDataIndexpicModel class],@"list":[TuWanDataListModel class]};
}


@end


@implementation TuWanDataIndexpicModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"typeName":@"typename"};
}
+(NSDictionary *)objectClassInArray
{
    return @{@"showitem":[TuwanDataListShowItemModel class]};
}


@end
@implementation TuWanDataListModel



@end
@implementation TuWanDataListInfoChildModel



@end
@implementation TuwanDataListShowItemModel



@end
@implementation TuwanDataListShowItemInfoModel



@end
