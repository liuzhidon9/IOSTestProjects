//
//  SourceViewController.m
//  UINavigationControllerDemo
//
//  Created by donview on 2021/12/6.
//

#import "SourceViewController.h"
#import "DestinationViewController.h"

@interface SourceViewController ()

@end

@implementation SourceViewController

- (NSString *)content{
    if (_content==nil){
        _content = @"源视图控制器";
    }
    return  _content;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SourceViewController";
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bounds.size.height, self.view.bounds.size.width, 100)];
    label.text = self.content;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:36 weight:UIFontWeightBold];
    
    UIButton *destBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    destBtn.frame = CGRectMake(0, self.view.bounds.size.width, 200, 50);
    [destBtn setTitle:@"destBtn" forState:UIControlStateNormal];
    destBtn.backgroundColor = [UIColor orangeColor];
    [destBtn addTarget:self action:@selector(goTodestVC) forControlEvents:UIControlEventTouchUpInside];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage:) name:@"destinationReturnValue" object:nil];
    
    [self.view addSubview: label];
    [self.view addSubview:destBtn];
}

-(void)receiveMessage:(NSNotification *)notification{
    NSString *string = (NSString *) notification.object;
    NSLog(@"receive message:%@",string);
}

-(void)goTodestVC{
    DestinationViewController *destVC = [[DestinationViewController alloc] init];
    destVC.content = [NSString stringWithFormat:@"%ud",arc4random()*10000000];
    destVC.delegate = self;
    destVC.block = ^(NSString *dataString){
        NSLog(@"block data:%@",dataString);
    };
    [self.navigationController pushViewController:destVC animated:YES];
}
-(void) back{}
- (void)destinationViewController:(DestinationViewController *)destinationViewController returnValue:(NSString *)string{
    NSLog(@"%@",string);
    self.content = string;
    UILabel *label = [[self.view subviews ]firstObject];
    label.text = string;
}

- (void)dealloc
{
    //移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
