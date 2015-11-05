//
//  DuoWanHeroFuwenDaPeiModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class FuwendapeiModel;
@interface DuoWanHeroFuwenDaPeiModel : BaseModel

@property (nonatomic, strong) NSArray *fuWenDaPei;

@end
@interface FuwendapeiModel : NSObject

@property (nonatomic, copy) NSString *tianDes;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *fuDes;

@property (nonatomic, copy) NSString *fuPic;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *tianPic;

@end

