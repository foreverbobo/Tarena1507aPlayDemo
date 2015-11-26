//
//  HeroViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroViewController.h"
#import "HeroListViewController.h"
#import "PageViewController.h"
@interface HeroViewController ()
@property (nonatomic,strong)NSArray *controllersArray;
@property (nonatomic,strong)NSArray *buttonNameArr;
@end

@implementation HeroViewController
- (NSArray *)buttonNameArr {
    if(_buttonNameArr == nil) {
        _buttonNameArr = @[@"免费英雄",@"全部英雄"];
    }
    return _buttonNameArr;
}
-(instancetype)init
{
    if(self = [super init])
    {
        self.title = @"英雄";
    }
    return self;
}
//配置pageController需要的vc
- (NSArray *)controllersArray {
    if(_controllersArray == nil) {
        HeroListViewController *vc1 = [[HeroListViewController alloc]initWithHeroType:HeroTypeFree];
        HeroListViewController *vc2 = [[HeroListViewController alloc]initWithHeroType:HeroTypeAll];
        _controllersArray = @[vc1,vc2];
    }
    return _controllersArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [FactoryClass addMenuItemToVC:self];
    
    PageViewController *pageVC1 = [[PageViewController alloc]initWithControlArray:self.controllersArray buttonNameArr:self.buttonNameArr topHeight:50 selectImage:[UIImage imageNamed:@"bg_navigationBar_normal"] unSelectImage:[UIImage imageNamed:@"navigationbar_bg"]];
    [self addChildViewController:pageVC1];
    [self.view addSubview:pageVC1.view];

    
}



@end
