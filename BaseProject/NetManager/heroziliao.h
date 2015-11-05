//
//  heroziliao.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/2.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanHeroMaterialModel.h"
@interface heroziliao : BaseNetManager
+(id)getDataWithCompletionHandle:(void(^)(DuoWanHeroMaterialModel *model,NSError *error))completionHandle;
@end
