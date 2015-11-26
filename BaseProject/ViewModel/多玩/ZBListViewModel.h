//
//  ZBListViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBListViewModel : BaseViewModel
@property (nonatomic,assign)NSInteger rowNumber;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)tagForRow:(NSInteger)row;
@end
