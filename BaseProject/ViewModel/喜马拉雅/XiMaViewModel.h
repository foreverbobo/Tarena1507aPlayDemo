//
//  XiMaViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"
@interface XiMaViewModel : BaseViewModel
/** 数据的条数 */
@property (nonatomic,assign)NSInteger rowNumber;
/** 某条数据的图片URL */
-(NSURL *)iconURLForRow:(NSInteger)row;
/** 某条数据的题目 */
-(NSString *)titleForRow:(NSInteger)row;
/** 某条数据的描述 */
-(NSString *)descForRow:(NSInteger)row;
/** 某条数据的集数 */
-(NSString *)numberForRow:(NSInteger)row;


@property (nonatomic,assign)NSInteger page;
@property (nonatomic,assign)NSInteger maxPage;
@property (nonatomic,strong)NSString *identify;

-(NSInteger)albumIdForRow:(NSInteger)row;
@end
