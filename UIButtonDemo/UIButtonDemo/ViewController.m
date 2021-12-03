//
//  ViewController.m
//  UIButtonDemo
//
//  Created by donview on 2021/12/2.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 200, 50);
    //设置按钮文字
    [button setTitle:@"check" forState:UIControlStateNormal];
    //设置按钮文字高亮颜色
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    //设置按钮的背景颜色
    button.backgroundColor = [UIColor redColor];
    //设置图片
    [button setImage:[UIImage imageNamed:@"magical-tree"] forState:UIControlStateNormal];
    //设置图片的边界距离
    [button setImageEdgeInsets:UIEdgeInsetsMake(5, 10, 5, 150)];
    //设置按钮圆角
    button.layer.cornerRadius = 10;
    //设置图片圆角
    button.imageView.layer.cornerRadius = 10;
    //设置字体大小
    button.titleLabel.font = [UIFont systemFontOfSize:36 weight:UIFontWeightBold];
    [self.view addSubview:button];
    
}


@end
