//
//  SearchDetailViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "SearchDetailViewController.h"

@interface SearchDetailViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation SearchDetailViewController
-(id)initWithRequest:(NSURLRequest *)request
{
    if (self = [super init]) {
        self.request = request;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
-(UIWebView *)webView
{
    if(!_webView)
    {
        _webView = [UIWebView new];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_webView loadRequest:_request];
        _webView.delegate = self;
    }
    return _webView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.hidden = NO;
    [FactoryClass addReturnItemToVC:self];
    self.title = @"召唤师详情";
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType != 5) {
        SearchDetailViewController *detailVC=[[SearchDetailViewController alloc] initWithRequest:request];
        [self.navigationController pushViewController:detailVC animated:YES];
        return NO;
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self hideProgress];
}

@end
