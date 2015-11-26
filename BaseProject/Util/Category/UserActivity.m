//
//  UserActivity.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/16.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "UserActivity.h"

@implementation UserActivity

+(void)registWithUserName:(NSString *)userName Pwd:(NSString *)password completionHandle:(void(^)(BOOL successful,NSError *error))comletionHandle
{
    BmobObject *obj = [BmobObject objectWithClassName:@"User"];
    [obj setObject:userName forKey:@"username"];
    [obj setObject:password forKey:@"userpwd"];
    [obj saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        comletionHandle(isSuccessful,error);
    }];
}
@end
