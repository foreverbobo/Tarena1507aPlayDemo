//
//  PlayView.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/10.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface PlayView : UIView
+(PlayView *)sharedInsstence;
@property (nonatomic,strong)AVPlayer *player;
@property (nonatomic,strong)UIButton *playBtn;
-(void)playWithUrl:(NSURL *)musicUrl;
@end
