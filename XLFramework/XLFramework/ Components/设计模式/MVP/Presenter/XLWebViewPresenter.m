//
//  XLWebViewPresenter.m
//  XLFramework
//
//  Created by Jack Wang on 2018/12/25.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLWebViewPresenter.h"



@interface XLWebViewPresenter ()

@property (nonatomic, strong) WKWebView *xl_webview;

@property (nonatomic, strong) UIProgressView *xl_ProgressView;

@property (nonatomic, weak) UIViewController *xl_Controller;


@end

@implementation XLWebViewPresenter


#pragma mark - XLWebViewPresenterProtocol
- (void)setView:(NSObject *)view;
{
    UIView *baseView = (UIView *)view;
    [baseView addSubview:self.xl_webview];
    [self.xl_webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(baseView);
    }];
    
    [baseView addSubview:self.xl_ProgressView];
    [self.xl_ProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(baseView);
        make.height.mas_equalTo(1.0f);
    }];
}
- (void)setViewController:(UIViewController *)viewController
{
    _xl_Controller = viewController;
}

- (void)presentWithModel:(id)model viewController:(UIViewController *)viewController
{
    NSURL *url = (NSURL *)model;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.xl_webview loadRequest:request];
}
#pragma mark - WKNavigationDelegate,WKUIDelegate
//页面开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    
}
//页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
   
}
//页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(nonnull NSError *)error
{
    // 一个页面没有被加载完成之前，收到下一个请求处理。
    if ([error code] == NSURLErrorCancelled)
    {
        return;
    }
    NSLog(@"页面记载失败%@",error.localizedDescription);
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
}
#ifdef __IPHONE_9_0
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView
{
    [self.xl_webview reload];
}
#endif
#pragma mark - event response
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.xl_webview && [keyPath isEqualToString:@"estimatedProgress"])
    {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        self.xl_ProgressView.alpha = 1.0f;
        [self.xl_ProgressView setProgress:newprogress animated:YES];
        if (newprogress >= 1.0f)
        {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 self.xl_ProgressView.alpha = 0.0f;
                             }
                             completion:^(BOOL finished) {
                                 [self.xl_ProgressView setProgress:0 animated:NO];
                             }];
        }
        
    }
    else if (object == self.xl_webview &&[keyPath isEqualToString:@"title"])
    {
        UIViewController *vc = (UIViewController *)_xl_Controller;
        vc.title = self.xl_webview.title;
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - getter
- (UIProgressView *)xl_ProgressView
{
    if (!_xl_ProgressView)
    {
        _xl_ProgressView = [[UIProgressView alloc] init];
        _xl_ProgressView.tintColor = [UIColor colorWithRed:0.0f/255.0f green:179.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
        _xl_ProgressView.trackTintColor = [UIColor whiteColor];
    }
    
    return _xl_ProgressView;
}
- (WKWebView *)xl_webview
{
    if (!_xl_webview)
    {
        _xl_webview = [[WKWebView alloc] init];
        _xl_webview.UIDelegate = self;
        _xl_webview.navigationDelegate = self;
        _xl_webview.opaque = NO;
        _xl_webview.multipleTouchEnabled = YES;
        [_xl_webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [_xl_webview addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _xl_webview;
}
- (void)dealloc
{
    [self.xl_webview removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.xl_webview removeObserver:self forKeyPath:@"title"];
    [self.xl_webview setNavigationDelegate:nil];
    [self.xl_webview setUIDelegate:nil];
    _xl_Controller = nil;
    NSLog(@"%@ dealloc",[self class]);
}

@end
