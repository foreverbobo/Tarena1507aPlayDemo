//
//  DuoWanHeroChangeModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class DuoWanChangelog;
@interface DuoWanHeroChangeModel : BaseModel

@property (nonatomic, copy) NSString *gold;

@property (nonatomic, copy) NSString *coupon;

@property (nonatomic, strong) NSArray *changeLog;

@property (nonatomic, copy) NSString *eName;

@property (nonatomic, copy) NSString *cName;

@property (nonatomic, copy) NSString *location;

@end
@interface DuoWanChangelog : NSObject

@property (nonatomic, copy) NSString *version;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *info;

@end

