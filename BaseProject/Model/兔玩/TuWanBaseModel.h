//
//  TuWanBaseModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseModel.h"
@class TuWanDataModel;
@class TuWanDataListInfoChildModel;
@class TuwanDataListShowItemInfoModel;

@interface TuWanBaseModel : BaseModel
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) TuWanDataModel *data;
@property (nonatomic, strong) NSString *code;
@end


@interface TuWanDataModel : BaseModel
@property (nonatomic, strong) NSArray *indexpic;
@property (nonatomic, strong) NSArray *list;
@end


@interface TuWanDataIndexpicModel : BaseModel
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *showtype;
@property (nonatomic, strong) NSString *click;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *typechild;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *longtitle;
@property (nonatomic, strong) NSArray *showitem;
@property (nonatomic, strong) NSString *html5;
@property (nonatomic, strong) TuWanDataListInfoChildModel *infochild;
@property (nonatomic, strong) NSString *litpic;
@property (nonatomic, assign) id toutiao;
@property (nonatomic, assign) double pictotal;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *murl;
@property (nonatomic, strong) NSString *banner;
@property (nonatomic, strong) NSString *zangs;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, assign) id timer;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *indexpicDescription;
@end

@interface TuWanDataListModel : TuWanDataIndexpicModel

@end

@interface TuWanDataListInfoChildModel : BaseModel
@property (nonatomic, assign) id shoot;
@property (nonatomic, assign) id feature;
@property (nonatomic, assign) id facial;
@property (nonatomic, assign) id cn;
@property (nonatomic, assign) id role;
@property (nonatomic, assign) id later;
@end


@interface TuwanDataListShowItemModel : BaseModel
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) TuwanDataListShowItemInfoModel *info;
@end

@interface TuwanDataListShowItemInfoModel : BaseModel
@property (nonatomic, strong) NSString *width;
@property (nonatomic, assign) double height;
@end