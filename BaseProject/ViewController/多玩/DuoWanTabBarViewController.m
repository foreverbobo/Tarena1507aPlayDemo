//
//  DuoWanTabBarViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanTabBarViewController.h"
#import "HeroViewController.h"
#import "BaiKeViewController.h"
#import "SearchViewController.h"
@interface DuoWanTabBarViewController ()

@end

@implementation DuoWanTabBarViewController
+(DuoWanTabBarViewController *)standardInstanse
{
    static DuoWanTabBarViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [DuoWanTabBarViewController new];
        
    });
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tabBar.translucent = NO;
   // self.tabBar.hidden = YES;
    //初始化三个子视图  放到tabbar中
    HeroViewController *hero = [HeroViewController new];
    SearchViewController *search = [SearchViewController new];
    BaiKeViewController *baike = [BaiKeViewController new];
    UINavigationController *heroNavi = [[UINavigationController alloc]initWithRootViewController:hero];
    UINavigationController *searchNavi = [[UINavigationController alloc]initWithRootViewController:search];
    UINavigationController *baikeNavi = [[UINavigationController alloc]initWithRootViewController:baike];
    self.viewControllers = @[heroNavi,baikeNavi,searchNavi];
}





@end
