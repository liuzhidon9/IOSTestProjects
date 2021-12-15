//
//  ViewController.m
//  多线程练习Demo
//
//  Created by donview on 2021/12/13.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)doSomething{
    static int a = 1;
    NSLog(@"doSomething:%d",a++);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSThread *currentThread =  [NSThread currentThread];
    NSLog(@"当前线程对象：%@",currentThread);
    
    NSThread *mainThread = [NSThread mainThread];
    NSLog(@"主线程对象：%@",mainThread);
    
//    NSLog(@"%@",[NSDate date]);
//    [NSThread sleepForTimeInterval:3];
//    NSLog(@"%@",[NSDate date]);
    
#pragma mark 异步任务+并行队列
    //获取并行队列
//    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue1, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异异步任务+并行队列1：%d",i);
//        }
//        NSLog(@"异步任务+并行队列1-线程：%@",[NSThread currentThread]);
//    });
//
//    dispatch_async(queue1, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异步任务+并行队列2：%d",i);
//        }
//        NSLog(@"异步任务+并行队列2-线程：%@",[NSThread currentThread]);
//    });
//
//    dispatch_async(queue1, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异步任务+并行队列3：%d",i);
//        }
//        NSLog(@"异步任务+并行队列3-线程：%@",[NSThread currentThread]);
//    });
//    NSLog(@"这是主线程log");
    //异步任务+并行队列会开启多个线程，每个任务会在不同的线程中并行执行
    
#pragma mark 异步任务+串行队列
//    dispatch_queue_t queue2 = dispatch_queue_create("test", NULL);
//    dispatch_async(queue2, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异步任务+串行队列1：%d",i);
//        }
//        NSLog(@"异步任务+串行队列1-线程：%@",[NSThread currentThread]);
//    });
//
//    dispatch_async(queue2, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异步任务+串行队列2：%d",i);
//        }
//        NSLog(@"异步任务+串行队列2-线程：%@",[NSThread currentThread]);
//    });
//
//    dispatch_async(queue2, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异步任务+串行队列3：%d",i);
//        }
//        NSLog(@"异步任务+串行队列3-线程：%@",[NSThread currentThread]);
//    });
//    NSLog(@"这是主线程log");
    //异步任务+串行队列只会开启一个线程，所有任务都在同一个线程中按顺序执行。
    
#pragma mark 异步任务+主队列
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    dispatch_async(mainQueue, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异步任务+主队列1：%d",i);
//        }
//        NSLog(@"异步任务+主队列1-线程：%@",[NSThread currentThread]);
//    });
//
//    dispatch_async(mainQueue, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异步任务+主队列2：%d",i);
//        }
//        NSLog(@"异步任务+主队列2-线程：%@",[NSThread currentThread]);
//    });
//
//    dispatch_async(mainQueue, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"异步任务+主队列3：%d",i);
//        }
//        NSLog(@"异步任务+主队列3-线程：%@",[NSThread currentThread]);
//    });
//    NSLog(@"这是主线程log");
    //异步任务+主队列：任务在主线程中按顺序执行，并且不会阻塞主线程。
    
    
#pragma mark 同步任务+并行队列
//    dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_sync(queue3, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"同步任务+并行队列1：%d",i);
//        }
//        NSLog(@"同步任务+并行队列1-线程：%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue3, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"同步任务+并行队列2：%d",i);
//        }
//        NSLog(@"同步任务+并行队列2-线程：%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue3, ^{
//        for (int i = 0; i<3; i++) {
//            NSLog(@"同步任务+并行队列3：%d",i);
//        }
//        NSLog(@"同步任务+并行队列3-线程：%@",[NSThread currentThread]);
//    });
//    NSLog(@"这是主线程log");
    //同步任务+并行队列：在当前线程中执行，并且会阻塞当前线程。即使把同步任务放到并行队列中，也只有一个线程并且任务按顺序执行。
    
#pragma mark 同步任务+串行队列
//    dispatch_queue_t queue4 = dispatch_queue_create("queue4", NULL);
//    dispatch_sync(queue4, ^{
//        for (int i = 0; i<3; i++) {
//                  NSLog(@"同步任务+串行队列1：%d",i);
//              }
//              NSLog(@"同步任务+串行队列1-线程：%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue4, ^{
//        for (int i = 0; i<3; i++) {
//                  NSLog(@"同步任务+串行队列2：%d",i);
//              }
//              NSLog(@"同步任务+串行队列2-线程：%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue4, ^{
//        for (int i = 0; i<3; i++) {
//                  NSLog(@"同步任务+串行队列3：%d",i);
//              }
//              NSLog(@"同步任务+串行队列3-线程：%@",[NSThread currentThread]);
//    });
//    NSLog(@"这是主线程log");
    //同步任务+串行队列：在当前线程中执行，并且会阻塞当前线程。即使把同步任务放到并行队列中，也只有一个线程并且任务按顺序执行。
    
#pragma mark 线程通信
    //使用异步任务+并行队列的方式实现下载网络图片，不阻塞主线程。并且在网络图片下载完成之后在子任务里更新主线程的UIImageView。
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:imageView];
//
//    dispatch_queue_t queue5 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//    dispatch_async(queue5, ^{
//        NSLog(@"加载网络图片中...");
//        NSURL *url = [NSURL URLWithString:@"https://cdn9-banquan.ituchong.com/weili/l/919778310330646605.webp"];
//        NSData *imageData = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:imageData];
//
//        //返回主队列设置图片。
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIImageView *imageView =  (UIImageView *)[self.view.subviews lastObject];
//            imageView.image = image;
//        });
//    });
//    NSLog(@"其他主线程操作");
    
#pragma mark 队列组
//    并行队列中的任务由于是分配到不同的线程中执行，所以任务完成的顺序不能确定。如果需要给并行队列中的任务设置执行顺序的话，可以使用队列组。
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 160, 200, 150)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 350, 300, 50)];
    label.font = [UIFont systemFontOfSize:36 weight:UIFontWeightBold];
    label.text = @"正在加载图片...";
    [self.view addSubview:imageView1];
    [self.view addSubview:imageView2];
    [self.view addSubview:label];

    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue6 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_group_async(group, queue6, ^{
        NSLog(@"加载第一张网络图片");
        NSURL *url = [NSURL URLWithString:@"https://cdn6-banquan.ituchong.com/weili/l/919795258271596547.webp"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        [NSThread sleepForTimeInterval:2];
        //返回主队列设置图片。
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageView =  (UIImageView *)[self.view.subviews objectAtIndex:0];
            imageView.image = image;
        });
    });

    dispatch_group_async(group, queue6, ^{
        NSLog(@"加载第二张网络图片");
        NSURL *url = [NSURL URLWithString:@"https://cdn6-banquan.ituchong.com/weili/l/913146374019088384.webp"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        [NSThread sleepForTimeInterval:3];
        //返回主队列设置图片。
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageView =  (UIImageView *)[self.view.subviews objectAtIndex:1];
            imageView.image = image;
        });
    });

    dispatch_group_notify(group, queue6, ^{
        NSLog(@"网络图片加载完成");
        dispatch_sync(dispatch_get_main_queue(), ^{
            UILabel *label = (UILabel *)[self.view.subviews lastObject];
            label.text = @"加载完成！";
        });
    });
    NSLog(@"其他主线程操作...");
//    [self doSomething];
//    [self doSomething];
//    [self doSomething];
//    [self doSomething];
//    [self doSomething];
}


@end
