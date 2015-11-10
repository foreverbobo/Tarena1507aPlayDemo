//
//  XiMaAlbumViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"
@interface XiMaAlbumViewModel : BaseViewModel
@property (nonatomic,assign)NSInteger rowNumber;
/** 图标url */
-(NSURL *)iconUrlForRow:(NSInteger)row;
/** 题目 */
-(NSString *)titleForRow:(NSInteger)row;
/** 所属专辑名 */
-(NSString *)nickTitleForRow:(NSInteger)row;
/** 喜欢个数 */
-(NSInteger)likeNumberForRow:(NSInteger)row;
/** 播放次数 */
-(NSInteger)playtimesNumberForRow:(NSInteger)row;
/** 评论次数 */
-(NSInteger)commentsForRow:(NSInteger)row;
/** 播放时长 */
-(NSString *)durationForRow:(NSInteger)row;
/** 更新时间 */
-(NSString *)updateForRow:(NSInteger)row;

@property (nonatomic,assign)NSInteger albumID;
@property (nonatomic,assign)NSInteger page;
-(id)initWithAlbumID:(NSInteger)albumID;

@end
