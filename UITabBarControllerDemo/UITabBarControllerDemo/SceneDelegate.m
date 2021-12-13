//
//  SceneDelegate.m
//  UITabBarControllerDemo
//
//  Created by donview on 2021/12/7.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    //微信
    ViewController *homeVC = [[ViewController alloc]init];
    homeVC.title = @"微信";
    UINavigationController *homeNavController = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UITabBarItem *item0 = [[UITabBarItem alloc ] initWithTitle:homeVC.title image:[UIImage imageNamed:@"WeChat"] selectedImage:[UIImage imageNamed:@"WeChat-active"]];
    item0.badgeValue=@"new";
    item0.badgeColor = [UIColor systemPinkColor];
    homeVC.tabBarItem = item0;
    
    //通讯录
    ViewController *contactVC = [[ViewController alloc]init];
    contactVC.title = @"通讯录";
    UINavigationController *contactNavController = [[UINavigationController alloc] initWithRootViewController:contactVC];
    UITabBarItem *item1 = [[UITabBarItem alloc ] initWithTitle:contactVC.title image:[UIImage imageNamed:@"nav_contacts"] selectedImage:[UIImage imageNamed:@"nav_contacts-active"]];
    contactVC.tabBarItem = item1;
    
    //发现
    ViewController *findVC = [[ViewController alloc]init];
    findVC.title = @"发现";
    UINavigationController *findNavController = [[UINavigationController alloc] initWithRootViewController:findVC];
    UITabBarItem *item2 = [[UITabBarItem alloc ] initWithTitle:findVC.title image:[UIImage imageNamed:@"find"] selectedImage:[UIImage imageNamed:@"find-active"]];
    findVC.tabBarItem = item2;
    
    //我的
    ViewController *mineVC = [[ViewController alloc]init];
    mineVC.title = @"我的";
    UINavigationController *mineNavController = [[UINavigationController alloc] initWithRootViewController:mineVC];
    UITabBarItem *item3 = [[UITabBarItem alloc ] initWithTitle:mineVC.title image:[UIImage imageNamed:@"mine"] selectedImage:[UIImage imageNamed:@"mine-active"]];
    mineVC.tabBarItem = item3;

    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[homeNavController,contactNavController,findNavController,mineNavController];
    tabBarController.selectedViewController = homeNavController;
    tabBarController.tabBar.tintColor = [UIColor greenColor];
    tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    tabBarController.tabBar.opaque =YES;
    tabBarController.tabBar.barStyle = UIBarStyleBlackOpaque;
    
    //设置每个tabar的item选中时使用原图片
    for (UITabBarItem *item in tabBarController.tabBar.items) {
        UIImage *image = item.selectedImage;
        UIImage *correctImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = correctImage;
    }
    
    self.window = [[UIWindow alloc]initWithWindowScene:scene];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
