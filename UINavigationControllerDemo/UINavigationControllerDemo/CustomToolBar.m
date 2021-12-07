//
//  CustomToolBar.m
//  UINavigationControllerDemo
//
//  Created by donview on 2021/12/6.
//

#import "CustomToolBar.h"

@implementation CustomToolBar
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.barStyle = UIBarStyleBlack;
    }
    return  self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIBarButtonItem *tool1 = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:nil];
        self.backgroundColor = [UIColor greenColor];
        self.items = @[tool1];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
