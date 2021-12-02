//
//  ViewController.m
//  UIView
//
//  Created by donview on 2021/12/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 50, 50)];
    view2.backgroundColor = [UIColor greenColor];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction)];
    [view1 addGestureRecognizer: longPress];
    [view1 addSubview:view2];
//    UIView *maskView = [[UIView alloc]initWithFrame:self.view.bounds];
//    maskView.backgroundColor = [UIColor blackColor];
//    maskView.alpha = 0.3;
//    view.maskView = maskView;
//    view.transform = CGAffineTransformScale(view.transform, 1.5, 1);
//    view.transform = CGAffineTransformRotate(view.transform, 45);
    NSLog(@"view2 在父视图view1坐标系的坐标为 x:%f,y:%f",view2.frame.origin.x,view2.frame.origin.y);
    
    CGRect newFrame =   [view1 convertRect:view2.frame toView:self.view];
    NSLog(@"view2 在控制器view坐标系的坐标为 x:%f,y:%f",newFrame.origin.x,newFrame.origin.y);
    [self.view addSubview:view1];
    [self.view bringSubviewToFront:view1];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIView *view = (UIView *)[self.view.subviews lastObject];
//    [UIView animateWithDuration:1.5 animations:^{
//            view.backgroundColor = [UIColor orangeColor];
//            view.transform = CGAffineTransformScale(view.transform, 1.5, 1.5);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1.5 animations:^{
//            view.backgroundColor = [UIColor redColor];
//            view.transform = CGAffineTransformIdentity;
//        }];
//    }];
//}
- (void) longPressAction{
    NSLog(@"long press at view1");
    //移除手势
    UIView *view1 = (UIView *)[[self.view subviews] lastObject];
    UILongPressGestureRecognizer *longPress = [view1.gestureRecognizers lastObject];
    [view1 removeGestureRecognizer:longPress];
}


@end
