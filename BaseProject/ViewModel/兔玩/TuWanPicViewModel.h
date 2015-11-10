//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanBaseNetManager.h"
@interface TuWanPicViewModel : BaseViewModel
@property (nonatomic,strong)NSArray *imageUrls;
@property (nonatomic,strong)NSString *aid;
-(id)initWithAid:(NSString *)aid;
@property (nonatomic,assign)NSInteger picNumber;
-(NSURL *)urlWithIndex:(NSInteger)index;
@end
