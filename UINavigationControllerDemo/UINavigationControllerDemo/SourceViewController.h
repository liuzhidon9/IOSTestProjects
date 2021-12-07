//
//  SourceViewController.h
//  UINavigationControllerDemo
//
//  Created by donview on 2021/12/6.
//

#import <UIKit/UIKit.h>
#import "DestinationViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SourceViewController : UIViewController<DestinationDelegate>

@property (nonatomic,strong) NSString *content;

@end

NS_ASSUME_NONNULL_END
