//
//  DuoWanFreeHero.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class DuoWanFreeHeroModel;
@interface DuoWanFreeHero : BaseModel

@property (nonatomic, strong) NSArray<DuoWanFreeHeroModel *> *free;

@property (nonatomic, copy) NSString *desc;

@end
@interface DuoWanFreeHeroModel : NSObject

@property (nonatomic, copy) NSString *enName;

@property (nonatomic, copy) NSString *cnName;

@property (nonatomic, copy) NSString *rating;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tags;

@end

