//
//  ZBTagViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBTagViewModel : BaseViewModel
@property (nonatomic,assign)NSInteger rowNumber;
-(NSInteger)idforRow:(NSInteger)row;
-(NSString *)textForRow:(NSInteger)row;

@property (nonatomic,strong)NSString *tag;
-(id)initWithTag:(NSString *)tag;
@end
