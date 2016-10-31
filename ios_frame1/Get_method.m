//
//  wifi.m
//  ios_frame1
//
//  Created by 文伟 冯 on 16/2/1.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "Get_method.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation Get_method
-(instancetype)init{
    _array = [NSMutableArray array];
    _array1 = [NSMutableArray array];
    [self runTests];
    return [super init];
    
}
- (void)runTests
{
    NSArray *_m = [NSArray array];
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        _m = [name componentsSeparatedByString:@"__"];
        if (_m.count>3) {
            [_array addObject: _m];
           // NSLog(@"~~~~~~~~~%@",name);
            
        }
    }
}



@end


