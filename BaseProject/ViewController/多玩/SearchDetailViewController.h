//
//  SearchDetailViewController.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailViewController : UIViewController
-(id)initWithRequest:(NSURLRequest *)request;
@property (nonatomic,strong)NSURLRequest *request;
@end
