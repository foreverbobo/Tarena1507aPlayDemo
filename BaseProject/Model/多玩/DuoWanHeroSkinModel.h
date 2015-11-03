//
//  DuoWanHeroSkinModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class Duowanheroskinarray;
@interface DuoWanHeroSkinModel : BaseModel

@property (nonatomic, strong) NSArray *duoWanHeroSkinArray;

@end
@interface Duowanheroskinarray : NSObject

@property (nonatomic, copy) NSString *identify;

@property (nonatomic, copy) NSString *bigImg;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *smallImg;

@end

