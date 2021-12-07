//
//  DestinationViewController.m
//  UINavigationControllerDemo
//
//  Created by donview on 2021/12/6.
//

#import "DestinationViewController.h"

@interface DestinationViewController ()

@end

@implementation DestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"destViewController";
    self.navigationController.toolbarHidden = NO;
    UIBarButtonItem *tool1 = [[UIBarButtonItem alloc] initWithTitle:@"go" style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.toolbarItems = @[tool1];
    
    UIBarButtonItem  *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.prompt = @"nav demo";
    self.navigationController.hidesBarsOnSwipe = YES;
    
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.text =self.content;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:36 weight:UIFontWeightBold];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    [self.navigationController.interactivePopGestureRecognizer addTarget:self action:@selector(back:)];
    
    [self.view addSubview: label];
}

- (void) back:(UIPanGestureRecognizer *) gesture{
    if ([gesture isKindOfClass:[UIPanGestureRecognizer class]]){
        CGPoint translationPoint = [gesture translationInView:self.view];
        CGPoint velocityPoint = [gesture velocityInView:self.view];
        NSLog(@"translationPoint:%f,%f",translationPoint.x,translationPoint.y);
        NSLog(@"velocityPoint:%f,%f",velocityPoint.x,velocityPoint.y);
        [gesture removeTarget:self action:@selector(back:)];
        return;
    }
    if([self.delegate respondsToSelector:@selector(destinationViewController:returnValue:)]){
        NSLog(@"delegate");
        [self.delegate destinationViewController:self returnValue:@"hello from destinationViewController"];
    }
    
    if(self.block){
        self.block(@"data from destination view controller");
    }
    
    [[NSNotificationCenter defaultCenter ] postNotificationName:@"destinationReturnValue" object:@"notification from destination view controller"];
    
    [self.navigationController popViewControllerAnimated:YES];
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
