//
//  ViewController.h
//  WKWebViewDemo
//
//  Created by donview on 2021/12/9.
//

#import <UIKit/UIKit.h>
#import <WebKit/WKNavigationDelegate.h>
#import <WebKit/WKScriptMessageHandler.h>

@interface ViewController : UIViewController<WKNavigationDelegate,WKScriptMessageHandler>


@end

