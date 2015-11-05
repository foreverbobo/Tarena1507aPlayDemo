//  AppDelegate.m
//  BaseProject
//
//  Created by 廖文博 on 15/10/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
-(RESideMenu *)sideMenu
{
    if(!_sideMenu)
    {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sidemenu 设置 背景图
        _sideMenu.backgroundImage = [UIImage imageNamed:@"a4825652"];
    }
    return _sideMenu;
}
-(UIWindow *)window
{
    if(!_window)
    {
        _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        [_window makeKeyAndVisible];
    }
    return _window;
}
/**配置全局UI的样式*/
-(void)configGlobalUIStyle
{
    /** 配置导航栏不透明   */
    [[UINavigationBar appearance] setTranslucent:NO];
    /**设置导航栏背景图  */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    /**配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize],NSForegroundColorAttributeName:kNaviTitleColor}];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    [self configGlobalUIStyle];
    self.window.rootViewController = self.sideMenu;
    return YES;
}

@end
