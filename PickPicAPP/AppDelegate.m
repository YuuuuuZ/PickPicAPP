//
//  AppDelegate.m
//  PickPicAPP
//
//  Created by mac on 16/6/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "CustomTabBarController.h"
#import "BaseViewController.h"
#import "BaseNavigationViewController.h"
#import "LoginViewController.h"
#import <MaxLeap/MaxLeap.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MaxLeap setApplicationId:@"57544700169e7d0001c8bafb" clientKey:@"bk1pWUxSbi1tWjBHRS1SMHl4NFk3dw" site:MLSiteCN];
    
    MLObject *obj = [MLObject objectWithoutDataWithClassName:@"Test" objectId:@"561c83c0226"];
    [obj fetchIfNeededInBackgroundWithBlock:^(MLObject * _Nullable object, NSError * _Nullable error) {
        if (error.code == kMLErrorInvalidObjectId) {
            NSLog(@"已经能够正确连接上您的云端应用");
        } else {
            NSLog(@"应用访问凭证不正确，请检查。");
        }
    }];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    /*--------------------------------------------------------------------*/
    
    //中间的标签控制器
    CustomTabBarController *tabBarC = [[CustomTabBarController alloc] initWithSelectedImage:nil tabBarBackgroundImage:[UIImage imageNamed:@"tabBar_bg.jpg"]];
    
    //控制器名字数组
    NSArray *controllers_array = @[@"Home",@"Message",@"Post",@"AboutMe"];
    //标签控制器的子控制器数组
    NSMutableArray *tabBar_controllers = [NSMutableArray array];
    
    for (int i=0; i<controllers_array.count; i++) {
        
        BaseViewController *vc = [[NSClassFromString([NSString stringWithFormat:@"%@ViewController",controllers_array[i]]) alloc] init];
        vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"tab_%d",i+1]];
        
        BaseNavigationViewController *nvc = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
        
        [tabBar_controllers addObject:nvc];
    }
    tabBarC.viewControllers = tabBar_controllers;
    
    //将侧滑控制器作为窗口的根视图控制器
   // self.window.rootViewController = tabBarC;
    
    //第一次加载的时候
    LoginViewController *loginVC = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    
    __weak AppDelegate *weakSelf = self;
    [loginVC setStartBlock:^{
        
        __strong AppDelegate *strongSelf = weakSelf;
        strongSelf.window.rootViewController = tabBarC;
    }];
    
    self.window.rootViewController = loginVC;
    
    if (currentUser) {
        if ([MLAnonymousUtils isLinkedWithUser:currentUser]) {
            //已经匿名登录
            self.window.rootViewController = loginVC;
        }else{
            //常规登录
            self.window.rootViewController = tabBarC;
        }
    }else{
        //未登录
        self.window.rootViewController = loginVC;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
