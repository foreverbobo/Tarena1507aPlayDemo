//
//  BaiKeWebViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaiKeWebViewController.h"

@interface BaiKeWebViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation BaiKeWebViewController
-(id)initWithUrl:(NSURL *)url
{
    if(self = [super init])
    {
        self.url = url;
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
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate = self;
    }
    return _webView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.hidden = NO;
    [FactoryClass addReturnItemToVC:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
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
