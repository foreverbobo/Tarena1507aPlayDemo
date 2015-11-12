//
//  DuoWanBaiKeListModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"

@class BaikeListArrayDataModel;
@interface DuoWanBaiKeListModel : BaseModel

@property (nonatomic, strong) NSArray *BaiKeListArray;

@end
@interface BaikeListArrayDataModel : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *url;
@end

