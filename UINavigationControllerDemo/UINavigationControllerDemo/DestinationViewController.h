//
//  DestinationViewController.h
//  UINavigationControllerDemo
//
//  Created by donview on 2021/12/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class DestinationViewController;

@protocol DestinationDelegate <NSObject>

- (void) destinationViewController:(DestinationViewController *)destinationViewController returnValue:(NSString *)string;

@end

@interface DestinationViewController : UIViewController

@property (nonatomic,copy) NSString *content;
@property (nonatomic,weak) id<DestinationDelegate> delegate;

typedef void (^PassDataBlock)(NSString *dataString);

@property (copy) PassDataBlock block;

@end

NS_ASSUME_NONNULL_END
