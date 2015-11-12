//
//  ToolMenuViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//
typedef NS_ENUM(NSUInteger, ToolMenuType) {
    ToolMenuTypeWeb,
    ToolMenuTypeNative
};
#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
/** 此处为type定义枚举类型，有web 和 native 2值 */
@interface ToolMenuViewModel : BaseViewModel

/** 有多少行 */
@property(nonatomic,assign)NSInteger rowNumber;
/** 返回的tag值 */
-(NSString *)tagForRow:(NSInteger)row;
/** 返回的iconUrl */
-(NSURL *)iconURLForRow:(NSInteger)row;
/** 返回的name */
-(NSString *)nameURLForRow:(NSInteger)row;
/** 返回的type值 */
-(ToolMenuType)typeForRow:(NSInteger)row;
/** 返回的url值 */
-(NSURL *)urlForRow:(NSInteger)row;
@end
