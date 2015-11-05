//
//  TuWanViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
@interface TuWanViewController ()

@end

@implementation TuWanViewController
+(UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [TuWanViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
        
    });
    return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"游戏资讯";
    self.view.backgroundColor = [UIColor greenSeaColor];
    
    [FactoryClass addMenuItemToVC:self];
}





@end
