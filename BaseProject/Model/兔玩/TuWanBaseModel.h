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
@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) TuWanDataListInfoChildModel *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *desc;
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