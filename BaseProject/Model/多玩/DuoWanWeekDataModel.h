//
//  DuoWanWeekDataModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/3.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class WeekDataModel,WeekDataChartsModel,WeekDataRatioData;
@interface DuoWanWeekDataModel : BaseModel

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) WeekDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface WeekDataModel : NSObject

@property (nonatomic, strong) NSArray *charts;

@property (nonatomic, assign) NSInteger average_win_ratio;

@property (nonatomic, assign) NSInteger average_k_num;

@property (nonatomic, assign) NSInteger champion_id;

@property (nonatomic, assign) NSInteger average_d_num;

@property (nonatomic, assign) NSInteger average_a_num;

@property (nonatomic, assign) NSInteger rank;

@end

@interface WeekDataChartsModel : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, strong) NSArray *ratio_data;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *y_axis_title;

@end

@interface WeekDataRatioData : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger value;

@end

