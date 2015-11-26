//
//  FactoryClass.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "FactoryClass.h"

@implementation FactoryClass
+(void)addMenuItemToVC:(UIViewController *)vc
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 30 , 30);
    [button bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    vc.navigationItem.leftBarButtonItems = @[spaceItem,buttonItem];

}

+(void)addReturnItemToVC:(UIViewController *)vc
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 45 , 44);
    [button bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    vc.navigationItem.leftBarButtonItems = @[spaceItem,buttonItem];

}
+(void)addreturnThirdVC:(UIViewController *)vc
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 45 , 44);
    [button bk_addEventHandler:^(id sender) {
        UIViewController *v = vc.navigationController.viewControllers[2];
        [vc.navigationController popToViewController:v animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    vc.navigationItem.leftBarButtonItems = @[spaceItem,buttonItem];
}
+(void)addShareItemToVC:(UIViewController *)vc 
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"icon_share_h"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_share_n"] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 45 , 44);
    [button bk_addEventHandler:^(id sender) {
        [UMSocialData defaultData].extConfig.sinaData.shareText = @"分享到新浪微博内容";
        [UMSocialData defaultData].extConfig.wechatTimelineData.shareImage = [UIImage imageNamed:@"about_iocn"]; //分享到腾讯微博图片
        //[[UMSocialData defaultData].extConfig.wechatSessionData.urlResource setResourceType:UMSocialUrlResourceTypeImage url:@"http://b256.photo.store.qq.com/psb?/c5a1021e-6fc5-4640-b06b-370445e507ad/vMbG.iHCsQ8.Xk.ctym08QGZyUwD433Pugr*YMYUrEw!/b/dIG2n5joCwAA&bo=gAJVAwAAAAABAPM!&rf=viewer_4"];  //设置微信好友分享url图片
        //[[UMSocialData defaultData].extConfig.wechatTimelineData.urlResource setResourceType:UMSocialUrlResourceTypeVideo url:@"http://v.youku.com/v_show/id_XNjQ1NjczNzEy.html?f=21207816&ev=2"]; //设置微信朋友圈分享视频
        
        [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"iOS：学习runtime的理解和心得";
        [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://www.cocoachina.com/ios/20150901/13173.html";
        [UMSocialSnsService presentSnsIconSheetView:vc
                                             appKey:@"563af08d67e58e4a4e0026b7"
                                          shareText:nil
                                         shareImage:nil
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,UMShareToSms,UMShareToEmail,UMShareToWechatTimeline,nil]
                                           delegate:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    vc.navigationItem.rightBarButtonItems = @[buttonItem,spaceItem];

}
@end
