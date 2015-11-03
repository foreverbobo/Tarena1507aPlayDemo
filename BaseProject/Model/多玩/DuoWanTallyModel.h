//
//  DuoWanTallyModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class Purple,Yellow,Blue,Red;
@interface DuoWanTallyModel : BaseModel

@property (nonatomic, strong) NSArray *Purple;

@property (nonatomic, strong) NSArray *Blue;

@property (nonatomic, strong) NSArray *Yellow;

@property (nonatomic, strong) NSArray *Red;

@end
@interface Purple : NSObject

@property (nonatomic, copy) NSString *Img;

@property (nonatomic, copy) NSString *Name;

@property (nonatomic, copy) NSString *lev3;

@property (nonatomic, assign) NSInteger Recom;

@property (nonatomic, copy) NSString *lev2;

@property (nonatomic, assign) NSInteger iplev3;

@property (nonatomic, copy) NSString *Units;

@property (nonatomic, assign) NSInteger Type;

@property (nonatomic, copy) NSString *Standby;

@property (nonatomic, copy) NSString *lev1;

@property (nonatomic, assign) NSInteger iplev2;

@property (nonatomic, copy) NSString *Alias;

@property (nonatomic, copy) NSString *Prop;

@property (nonatomic, assign) NSInteger iplev1;

@end

@interface Yellow : Purple


@end

@interface Blue : Purple


@end

@interface Red : Purple


@end

