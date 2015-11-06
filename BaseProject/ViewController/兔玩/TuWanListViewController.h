//
//  TuWanListViewController.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/6.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuWanViewModel.h"
@interface TuWanListViewController : UITableViewController
/** 接收外部传参，决定当前控制器显示的哪种类型的信息 */
@property (nonatomic,assign)TuWanListType type;

-(instancetype)initWithType:(TuWanListType)type;
@end
