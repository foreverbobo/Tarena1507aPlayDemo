//
//  MusicListViewController.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/10.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListViewController : UIViewController
@property (nonatomic,assign)NSInteger albumId;
-(instancetype)initWithAlbumId:(NSInteger)albumId;
@end
