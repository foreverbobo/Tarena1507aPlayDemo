//  AppDelegate.m
//  BaseProject
//
//  Created by 廖文博 on 15/10/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "heroziliao.h"
#import "TuWanBaseModel.h"
#import "TuWanBaseNetManager.h"
#import "DuoWanNetManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];

    return YES;
}

@end
