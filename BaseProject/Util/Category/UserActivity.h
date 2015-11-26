//
//  UserActivity.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/16.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserActivity : NSObject
+(void)loginWithUserName:(NSString *)userName Pwd:(NSString *)password completionHandle:(void(^)(BOOL successful,NSError *error))comletionHandle;
+(void)registWithUserName:(NSString *)userName Pwd:(NSString *)password completionHandle:(void(^)(BOOL successful,NSError *error))comletionHandle;
@end
