//
//  NSObject (Common)
//  BaseProject
//
//  Created by 廖文博 on 15/10/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

//显示失败提示
- (void)showErrorMsg:(NSObject *)msg;

//显示成功提示
- (void)showSuccessMsg:(NSObject *)msg;

//显示忙
- (void)showProgress;

//隐藏提示
- (void)hideProgress;

@end
