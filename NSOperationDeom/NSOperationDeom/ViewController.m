//
//  ViewController.m
//  NSOperationDeom
//
//  Created by donview on 2021/12/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark NSBlockOperation
#pragma  mark 无队列的情况下执行任务
//    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"task1---%@",[NSThread currentThread]);
//    }];
//    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"task2---%@",[NSThread currentThread]);
//    }];
//
//    [task1 start];
//    [task2 start];
//    NSLog(@"主线程的log");
    //在无队列的情况下调用start方法，会在当前线程串行执行任务。

#pragma mark 在队列中执行任务
//    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"task1---%@",[NSThread currentThread]);
//    }];
//    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"task2---%@",[NSThread currentThread]);
//    }];
//
////    在任务中直接添加新任务
//    [task2 addExecutionBlock:^{
//            NSLog(@"task3---%@",[NSThread currentThread]);
//    }];
//
//    NSOperationQueue *operationQueue1 = [[NSOperationQueue alloc] init];
//
//    [operationQueue1 addOperation:task1];
//    [operationQueue1 addOperation:task2];
//
//    //在队列中直接添加新任务
//    [operationQueue1 addOperationWithBlock:^{
//            NSLog(@"task4---%@",[NSThread currentThread]);
//    }];
//
//    NSLog(@"主线程log");
    //将任务添加到队列中，队列会自动创建新的线程去并行执行这些任务。
    
    
#pragma mark 线程间通信
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
//    [self.view addSubview:imageView];
//
//    NSBlockOperation *task3 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"图片加载中...");
//        NSURL *url = [NSURL URLWithString:@"https://cdn6-banquan.ituchong.com/weili/l/919795258271596547.webp"];
//        NSData *imageData = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:imageData];
//
////        返回主线程设置UI
//        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
//        [mainQueue addOperationWithBlock:^{
//                    UIImageView *imageView = (UIImageView *)[self.view.subviews lastObject];
//                    imageView.image = image;
//        }];
//    }];
//
////    设置task3完成后的再执行的代码
//    [task3 setCompletionBlock:^{
//            NSLog(@"图片加载完成");
//    }];
//
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:task3];
//
//    NSLog(@"主线程的其他操作...");
    
#pragma mark 任务间的执行依赖
//    创建两个任务，两个任务完成后，返回主线程执行更新label的第三个任务
//    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 300, 200)];
//    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 240, 300, 200)];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 500, 300, 50)];
//    label.font = [UIFont systemFontOfSize:36 weight:UIFontWeightBold];
//    label.text = @"正在加载图片...";
//
//    [self.view addSubview:imageView1];
//    [self.view addSubview:imageView2];
//    [self.view addSubview:label];
//
//    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"加载第一张网络图片");
//        NSURL *url = [NSURL URLWithString:@"https://cdn6-banquan.ituchong.com/weili/l/919795258271596547.webp"];
//        NSData *imageData = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:imageData];
//
//        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
//        [mainQueue addOperationWithBlock:^{
//                    UIImageView *imageView = (UIImageView *) [self.view.subviews objectAtIndex:0];
//            imageView.image = image;
//        }];
//    }];
//
//    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"加载第二张网络图片");
//        NSURL *url = [NSURL URLWithString:@"https://cdn6-banquan.ituchong.com/weili/l/913146374019088384.webp"];
//        NSData *imageData = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:imageData];
//
//        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
//        [mainQueue addOperationWithBlock:^{
//                    UIImageView *imageView = (UIImageView *) [self.view.subviews objectAtIndex:1];
//            imageView.image = image;
//        }];
//    }];
//
//    NSBlockOperation *task3 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"图片加载完成");
//        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
//        [mainQueue addOperationWithBlock:^{
//                    UILabel *label = (UILabel *)[self.view.subviews lastObject];
//                    label.text = @"图片加载完成";
//        }];
//    }];
//
//    //设置任务之间的依赖关系
//    [task3 addDependency:task1];
//    [task3 addDependency:task2];
//    [task2 addDependency:task1];
//
//    NSOperationQueue *queue = [[NSOperationQueue alloc ] init];
//    [queue addOperation:task1];
//    [queue addOperation:task2];
//    [queue addOperation:task3];
//
//    NSLog(@"主线程的其他操作...");
    
#pragma mark NSInvocationOperation
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(demo:) object:@"hello"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [queue addOperation:operation];
    NSLog(@"主线程的其他操作...");
    
}

-(void)demo:(nullable NSString *)value{
    NSLog(@"NSInvocationOperation:%@",value);
}


@end
