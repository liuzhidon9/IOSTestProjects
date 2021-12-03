//
//  ViewController.m
//  UITextFieldDemo
//
//  Created by donview on 2021/12/3.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 300, 50)];
    textField.placeholder = @"请输入文字";
    textField.text = @"*****";
    textField.keyboardType = UIKeyboardTypeDefault;
//    textField.textColor = [UIColor greenColor];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.returnKeyType = UIReturnKeyDone;
    textField.tag = 1103;
    textField.clearButtonMode =UITextFieldViewModeAlways;
//    textField.backgroundColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
//    [textField becomeFirstResponder];
    textField.delegate = self;
    textField.secureTextEntry = YES;
    [self.view addSubview:textField];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return  YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textField%ld开始编辑了",textField.tag);
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textField%ld结束编辑了",textField.tag);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"正在输入：%@",string);
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField endEditing:YES];
    return  YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITextField *textField = (UITextField *)[[self.view subviews ]lastObject];
    NSLog(@"tag:%ld",textField.tag);
    [textField resignFirstResponder];
}


@end
