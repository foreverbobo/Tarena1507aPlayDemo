//
//  XiMaTracksCell.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBImageView.h"
@interface XiMaTracksCell : UITableViewCell
/** 音乐封面图 */
@property (nonatomic,strong)WBImageView *iconIV;
/** 题目标签 */
@property (nonatomic,strong)UILabel *titleLb;
/** 添加时间标签 */
@property (nonatomic,strong)UILabel *timeLb;
/** 音乐来源标签 */
@property (nonatomic,strong)UILabel *nickLb;
/** 播放次数标签 */
@property (nonatomic,strong)UILabel *playTimeLb;
/** 喜欢次数标签 */
@property (nonatomic,strong)UILabel *likesLb;
/** 评论次数按钮 */
@property (nonatomic,strong)UILabel *commentLb;
/** 时长标签 */
@property (nonatomic,strong)UILabel *durationLb;
/** 下载按钮 */
@property (nonatomic,strong)UIButton *downLoadBtn;


@end
