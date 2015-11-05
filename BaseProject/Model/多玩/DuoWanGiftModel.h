//
//  DuoWanGiftModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class Attack,Defence,Useul;
@interface DuoWanGiftModel : BaseModel

@property (nonatomic, strong) NSArray *a;

@property (nonatomic, strong) NSArray *d;

@property (nonatomic, strong) NSArray *g;

@end


@interface Attack : NSObject

@property (nonatomic, copy) NSString *identify;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<NSString *> *level;

@end

@interface Defence : Attack



@end

@interface Useul : Attack



@end

