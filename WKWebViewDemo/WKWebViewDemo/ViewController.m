//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by donview on 2021/12/9.
//

#import "ViewController.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WKWebViewConfiguration.h>
#import <WebKit/WKPreferences.h>
#import <WebKit/WKUserContentController.h>
#import <WebKit/WKUserScript.h>
#import <WebKit/WKContentWorld.h>
#import <WebKit/WKScriptMessage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WKWebViewConfiguration *wkConfig = [[WKWebViewConfiguration alloc] init];
    
//    [wkConfig.preferences setValue:@YES forKey:@"allowFileAccessFromFileURLs"];
//    [wkConfig setValue:@YES forKey:@"allowUniversalAccessFromFileURLs"];
    wkConfig.preferences.javaScriptEnabled = YES;
//    wkConfig.allowsPictureInPictureMediaPlayback = YES;
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:@"window.location.href = '#/about'" injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
    [wkConfig.userContentController addUserScript:userScript];
    [wkConfig.userContentController addScriptMessageHandler:self name:@"log"];
    
    
    WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:wkConfig];
    wkWebView.allowsBackForwardNavigationGestures = YES;
    wkWebView.navigationDelegate = self;
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    NSLog(@"basePath:%@",basePath);
    NSString *htmlFilePath = [NSString stringWithFormat:@"%@/index.html",basePath];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *htmlContent = [NSString stringWithContentsOfFile:htmlFilePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"html file:%@",htmlContent);
    NSURL *bundleUrl = [[NSBundle mainBundle] bundleURL];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [wkWebView loadHTMLString:htmlContent baseURL:bundleUrl];
    [wkWebView loadRequest:request];
//    [wkWebView evaluateJavaScript:@"window.location.href = '#/about'" completionHandler:^(id _Nullable, NSError * _Nullable error) {
//            NSLog(@"evaluateJavaScript done");
//    }];
    
    [self.view addSubview:wkWebView];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"加载完成");
    [webView.configuration.userContentController removeAllUserScripts];
//    [webView evaluateJavaScript:@"window.location.href = 'https://www.baidu.com'" completionHandler:^(id _Nullable, NSError * _Nullable error) {
//                NSLog(@"evaluateJavaScript done");
//        }];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"message from web:%@",message.body);
}

@end
