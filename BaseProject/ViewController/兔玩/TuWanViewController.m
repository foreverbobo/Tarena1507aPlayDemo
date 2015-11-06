//
//  TuWanViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListViewController.h"
@interface TuWanViewController ()

@end

@implementation TuWanViewController
+(UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [[TuWanViewController alloc]initWithViewControllerClasses:[self controllerArray] andTheirTitles:[self itemsNames]];
        vc.keys = [self keysArray];
        vc.values = [self valuesArray];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
        
    });
    return navi;
}
/**
 TuWanListTypeToutiao,
 TuWanListTypeDujia,
 TuWanListTypeAnhei3,
 TuWanListTypeMoshou,
 TuWanListTypeFengbao,
 TuWanListTypeLushi,
 TuWanListTypeXingji2,
 TuWanListTypeShouwang,
 TuWanListTypeHuanhua,
 TuWanListTypeQuwen,
 TuWanListTypeCos,
 TuWanListTypeMeinv,
 TuWanListTypePicture,
 TuWanListTypeVideo,
 TuWanListTypeGuide
 *
 *
 */
+(NSArray *)itemsNames
{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"幻化",@"图片",@"视频",@"攻略",@"趣闻",@"Cos",@"美女"];

}
+(NSArray *)controllerArray
{
    NSMutableArray *array = [NSMutableArray new];
    for (id obj in [self itemsNames]) {
        [array addObject:[TuWanListViewController class]];
    }
    return [array copy];

}
+(NSArray *)keysArray
{
    NSMutableArray *array = [NSMutableArray new];
    for (id obj in [self itemsNames]) {
        [array addObject:@"type"];
    }
    return [array copy];
}
+(NSArray *)valuesArray
{
    NSMutableArray *array = [NSMutableArray new];
    NSInteger count = [self itemsNames].count;
    for (int i = 0; i < count ;i++)
    {
        [array addObject:@(i)];
    
    }
    return [array copy];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"游戏资讯";
    self.view.backgroundColor = [UIColor greenSeaColor];
    [FactoryClass addMenuItemToVC:self];
}





@end
