//
//  DuoWanSkillModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class SkillDataModel;
@interface DuoWanSkillModel : BaseModel

@property (nonatomic, strong) NSArray *skillArray;

@end
@interface SkillDataModel : NSObject

@property (nonatomic, copy) NSString *strong;

@property (nonatomic, copy) NSString *identify;

@property (nonatomic, copy) NSString *cooldown;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *tips;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *des;

@end

