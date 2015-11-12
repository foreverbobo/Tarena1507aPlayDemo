//
//  SearchViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"
@interface SearchViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation SearchViewController
-(instancetype)init
{
    if(self = [super init])
    {
        self.title = @"召唤师查询";
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
        _webView.delegate = self;
    }
    return _webView;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [FactoryClass addMenuItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    NSURL *url = [NSURL URLWithString:@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //点击web中的任意一项，推出下一页
    NSString *path = @"/phone/playerSearchNew.php";
    if(![request.URL.path isEqualToString:path])
    {
        SearchDetailViewController *detail = [[SearchDetailViewController alloc]initWithRequest:request];
        [self.navigationController pushViewController:detail animated:YES];
        return NO;
    }
   
    return YES;
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self hideProgress];
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
