//
//  DuoWanBestGoupViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface DuoWanBestGoupViewModel : BaseViewModel
@property (nonatomic,assign)NSInteger rowNumber;

-(NSString *)titleForRow:(NSInteger)row;
-(NSArray *)heroNamesForRow:(NSInteger)row;
-(NSArray *)heroDescForRow:(NSInteger)row;
-(NSString *)descForRow:(NSInteger)row;
@end
