//
//  PageViewController.h
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController
@property (nonatomic,strong)NSArray *controllersArray;
@property (nonatomic,strong)NSArray *buttonNameArr;
@property (nonatomic,assign)CGFloat topHeight;
@property (nonatomic,strong)UIImage *selectImage;
@property (nonatomic,strong)UIImage *unSelectImage;
-(instancetype)initWithControlArray:(NSArray *)controllArray buttonNameArr:(NSArray *)buttonNameArr topHeight:(CGFloat)topHeight selectImage:(UIImage *)selectImage unSelectImage:(UIImage *)unSelectImage;
@end
