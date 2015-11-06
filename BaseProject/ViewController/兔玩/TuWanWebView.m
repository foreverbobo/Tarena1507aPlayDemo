//
//  TuWanWebView.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/6.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanWebView.h"

@interface TuWanWebView ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation TuWanWebView
-(id)initWithURL:(NSURL *)url
{
    if(self = [super init])
    {
        _url = url;
    }
    return self;
}
-(UIWebView *)webView
{
    if(!_webView)
    {
        _webView = [UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:self.url]];
        _webView.delegate = self;
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [FactoryClass addReturnItemToVC:self];
}
#pragma mark -- WebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideProgress];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
