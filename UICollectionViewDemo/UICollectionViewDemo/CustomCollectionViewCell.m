//
//  CustomCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by donview on 2021/12/3.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
        label.text = @"label";
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 30, 100, 30);
        button.backgroundColor = [UIColor greenColor];
        [button setTitle:@"button" forState:UIControlStateNormal];
        
        [self.contentView addSubview:label];
        [self.contentView addSubview:button];
        self.layer.cornerRadius = 10;
    }
    return self;
}

@end
