//
//  ViewController.m
//  UITabBarControllerDemo
//
//  Created by donview on 2021/12/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 36)];
    text.text = self.title;
    text.font = [UIFont systemFontOfSize:36 weight:UIFontWeightBold];
    
    [self.view addSubview:text];
    NSLog(@"URL_VERSION: %@",URL_VERSION);
    NSString *version = @"v1";
    int versionNum  = [[version substringFromIndex:1] intValue];
    NSLog(@"versionNum:%d",versionNum);
}


@end
