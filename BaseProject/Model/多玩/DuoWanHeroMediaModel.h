//
//  DuoWanHeroMediaModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class DuoWanHeroMediaDataModel;
@interface DuoWanHeroMediaModel : BaseModel

@property (nonatomic, strong) NSArray *duoWanHeroMediaArray;

@end
@interface DuoWanHeroMediaDataModel : NSObject

@property (nonatomic, copy) NSString *cover_url;

@property (nonatomic, copy) NSString *udb;

@property (nonatomic, copy) NSString *channelId;

@property (nonatomic, copy) NSString *upload_time;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *letv_video_unique;

@property (nonatomic, copy) NSString *letv_video_id;

@property (nonatomic, assign) NSInteger video_length;

@property (nonatomic, assign) NSInteger totalPage;

@end

