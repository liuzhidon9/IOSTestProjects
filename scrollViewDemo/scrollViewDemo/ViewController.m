//
//  ViewController.m
//  scrollViewDemo
//
//  Created by donview on 2021/11/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    
    //创建一个scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    scrollView.scrollEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.pagingEnabled = YES;
    
    
    //设置滚动区域的大小
    scrollView.contentSize = self.imageView.bounds.size;
    
    scrollView.contentOffset = CGPointMake(200, 0);
    scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    scrollView.backgroundColor = [UIColor redColor];
    
    scrollView.delegate = self;
    
    //视图的缩放
    scrollView.minimumZoomScale = 0.3;
    scrollView.maximumZoomScale = 3;
    
    [scrollView addSubview:self.imageView];
    [self.view addSubview:scrollView];
}

-(UIImageView *) imageView{
    if(_imageView==nil){
       _imageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"magical-tree"]];
    }
    return  _imageView;
}

# pragma mark UIScrollViewDelegate
//滚动时不断调用
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"滚动中...x:%f, y:%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

//开始滚动时调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"开始滚动");
}

//手指离开屏幕，停止滚动时调用
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"停止滚动");
}

//设置缩放的视图
- (nullable UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

//视图缩放过程中不断调用
-(void) scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"缩放中...zoom:%f",scrollView.zoomScale);
}

//视图开始缩放时调用
-(void) scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"开始缩放");
}

//停止缩放时调用
-(void) scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"缩放结束");
}

@end
