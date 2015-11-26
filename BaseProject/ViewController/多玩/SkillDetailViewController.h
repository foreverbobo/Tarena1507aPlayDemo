//
//  SkillDetailViewController.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillDetailViewController : UIViewController
@property (nonatomic,strong)NSDictionary *dataDic;
-(id)initWithDataDic:(NSDictionary *)dataDic;
@end
