//
//  DuoWanEquipModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"



@interface DuoWanEquipModel : BaseModel
@property (nonatomic,strong)NSArray *equipArray;
@end




@interface EquipDataModel : BaseModel
@property (nonatomic, assign) NSInteger identify;

@property (nonatomic, strong) NSString *text;

@end

