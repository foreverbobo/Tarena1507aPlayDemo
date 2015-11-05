//
//  DuoWanEquipListModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class EquipArrayDataModel;
@interface DuoWanEquipListModel : BaseModel

@property (nonatomic, strong) NSArray *EquipArray;

@end
@interface EquipArrayDataModel : NSObject

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *text;

@end

