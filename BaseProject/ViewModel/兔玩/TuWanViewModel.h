//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanBaseNetManager.h"
@interface TuWanViewModel : BaseViewModel

@property (nonatomic,assign)TuWanListType type;
-(instancetype)initWithType:(TuWanListType)type;

/**判断某一行数据是否有图 */
-(BOOL)containImages:(NSInteger)row;
/** 返回列表中某行数据的题目 */
-(NSString *)titleForRowInList:(NSInteger)row;
/** 返回列表中某行数据的图片 */
-(NSURL *)iconUrlForRowInList:(NSInteger)row;
/** 返回列表中某行数据的描述 */
-(NSString *)descForRowInList:(NSInteger)row;
/** 返回列表中某行数据的浏览人数 */
-(NSString *)clicksForRowInList:(NSInteger)row;
-(NSURL *)htmlURLForRowInList:(NSInteger)row;

/** 滚动展示栏的图片 */
-(NSURL *)headerImageUrlWithRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的文字 */
-(NSString *)titleForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的数量 */
@property (nonatomic,assign)NSInteger headNumber;
-(NSURL *)htmlURLForRowInIndexPic:(NSInteger)row;


@property (nonatomic,assign)NSInteger start;
@property (nonatomic,assign)NSInteger rowNumber;

/**存放头部滚动栏 */
@property (nonatomic,getter=isExistIndexPic)BOOL existIndexPic;
/**判断是否有头部滚动栏 */
@property (nonatomic,strong)NSArray *indexPicArr;

@end
