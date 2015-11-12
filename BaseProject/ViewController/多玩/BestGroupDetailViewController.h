//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BestGroupDetailViewController : UIViewController
- (id)initWithTitle:(NSString *)title desc:(NSString *)desc nameArray:(NSArray *)nameArray decs:(NSArray *)descs;
@property(nonatomic,strong) NSString *title0; //区别系统关键词
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSArray *nameArray;
@property(nonatomic,strong) NSArray *descs;
@end
