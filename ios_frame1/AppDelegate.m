//
//  AppDelegate.m
//  ios_frame1
//
//  Created by fengwenwei on 16/1/31.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "AppDelegate.h"
//#ifdef DEBUG
//#  define LOG(fmt, ...) do {                                            \
//NSString* file = [[NSString alloc] initWithFormat:@"%s", __FILE__]; \
//NSLog((@"%@(%d) " fmt), [file lastPathComponent], __LINE__, ##__VA_ARGS__); \
//[file release];                                                 \
//} while(0)
//#  define LOG_METHOD NSLog(@"%s", __func__)
//#  define LOG_CMETHOD NSLog(@"%@/%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
//#  define COUNT(p) NSLog(@"%s(%d): count = %d\n", __func__, __LINE__, [p retainCount]);
//#  define LOG_TRACE(x) do {printf x; putchar('\n'); fflush(stdout);} while (0)
//#else
//#  define LOG(...)
//#  define LOG_METHOD
//#  define LOG_CMETHOD
//#  define COUNT(p)
//#  define LOG_TRACE(x)
//#endif
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  //  [self redirectNSLogToDocumentFolder];
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
//- (void)redirectNSLogToDocumentFolder{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *fileName =[NSString stringWithFormat:@"%@.text",[NSDate date]];
//    NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
//    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
//}
//- (void)applicationDidFinishLaunching:(UIApplication *)application {
//    // 真机测试时保存日志
//       UIDevice *CDeviceInfo = [UIDevicecurrentDevice];
//    if ([CDeviceInfo getModelType] != @"SIMULATOR") {
//        [self redirectNSLogToDocumentFolder];
//    }
//}
@end
