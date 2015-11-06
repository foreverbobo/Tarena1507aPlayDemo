//
//  FactoryClass.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "FactoryClass.h"

@implementation FactoryClass
+(void)addMenuItemToVC:(UIViewController *)vc
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 30 , 30);
    [button bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    vc.navigationItem.leftBarButtonItems = @[spaceItem,buttonItem];

}

+(void)addReturnItemToVC:(UIViewController *)vc
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 45 , 44);
    [button bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    vc.navigationItem.leftBarButtonItems = @[spaceItem,buttonItem];

}
@end
