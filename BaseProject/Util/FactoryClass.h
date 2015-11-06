//
//  FactoryClass.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactoryClass : NSObject
/**向某个控制器上添加菜单按钮 */
+(void)addMenuItemToVC:(UIViewController *)vc;
+(void)addReturnItemToVC:(UIViewController *)vc;
@end
