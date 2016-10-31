//
//  ViewController.m
//  ios_frame1
//
//  Created by fengwenwei on 16/1/31.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "ViewController.h"
#import "Get_method.h"
#import <Foundation/Foundation.h>
#ifdef DEBUG
#  define LOG(fmt, ...) do {                                            \
NSString* file = [[NSString alloc] initWithFormat:@"%s", __FILE__]; \
NSLog((@"%@(%d) " fmt), [file lastPathComponent], __LINE__, ##__VA_ARGS__); \
[file release];                                                 \
} while(0)
#  define LOG_METHOD NSLog(@"%s", __func__)
#  define LOG_CMETHOD NSLog(@"%@/%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#  define COUNT(p) NSLog(@"%s(%d): count = %d\n", __func__, __LINE__, [p retainCount]);
#  define LOG_TRACE(x) do {printf x; putchar('\n'); fflush(stdout);} while (0)
#else
#  define LOG(...)
#  define LOG_METHOD
#  define LOG_CMETHOD
#  define COUNT(p)
#  define LOG_TRACE(x)
#endif
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *path;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    Autotest *view=[[Autotest alloc]init];
   // [self redirectNSLogToDocumentFolder];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)get_the_path:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *fileName =[NSString stringWithFormat:@"%@.txt",[NSDate date]];
        NSLog(@"%@",documentsDirectory);
        NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
        NSFileManager *defaultManager = [NSFileManager defaultManager];
       [defaultManager removeItemAtPath:logFilePath error:nil];
        freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stdout);
       NSLog(@"%@",documentsDirectory);
    NSString *pathstring=documentsDirectory;
    _path.text=pathstring;
    
}

@end
