//
//  HeroViewModel.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
typedef NS_ENUM(NSUInteger, HeroType) {
    HeroTypeFree,
    HeroTypeAll
    
};
@interface HeroViewModel :BaseViewModel
@property (nonatomic,assign)HeroType type;
/**
 *  根据英雄类型去获取VM的创建 Free则获取Free的VM，ALL则获取All的VM
 */
-(instancetype)initWithHeroType:(HeroType)type;

/** 数据总数 */
@property (nonatomic,assign)NSInteger rowNumber;
/** 获取标题 */
-(NSString *)titleForRow:(NSInteger)row;
/** 获取中文名字 */
-(NSString *)cnNameForRow:(NSInteger)row;
/** 获取英文名字 */
-(NSString *)enNameForRow:(NSInteger)row;
/** 获取对位位置 */
-(NSString *)locationForRow:(NSInteger)row;
/** 获取英雄信息字典 */
-(NSDictionary *)heroInfoDicForRow:(NSInteger)row;

@end
