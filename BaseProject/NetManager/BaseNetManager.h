//
//  BaseNetManager.h
//  BaseProject
//
//  Created by 廖文博 on 15/10/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ComletionHandle compeletionHandle:(void(^)(id model,NSError *error))completionHandle
@interface BaseNetManager : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

@end
