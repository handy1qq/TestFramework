//
//  Autotest.m
//  ios_frame1
//
//  Created by fengwenwei on 16/1/31.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "Autotest.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation Autotest


-(instancetype)init{
  _array = [NSMutableArray array];
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
            if (_m.count>=4) {
                [_array addObject: _m];
              //  NSLog(@"pppp%@",_array);
                
            }
    }
}

//************************************************************************************
//************************************************************************************



-(void)AUTOTEST__wifi__emvUpdateParamqqqqqq__emvUpdateParam_fun01{
    NSLog(@"恭喜你，成功了1");
    
}


-(void)AUTOTEST__wifi__emvUpdateParamqq__emvUpdateParam_fun02{
    
    NSLog(@"恭喜你，成功了2");
    
}

-(void)AUTOTEST__wifi__emvUpdateParamqq__emvUpdateParam_fun03{
    
    NSLog(@"恭喜你，成功了3");
    
}

-(void)AUTOTEST__wifi__emv__emvUpdateParamtttt_fun03{
    
    NSLog(@"恭喜你，成功了3");
    
}
-(void)AUTOTEST__gps__emvUpdateParam__emvUpdateParam_tol01{
    NSLog(@"恭喜你，成功了4");
    
}


-(void)AUTOTEST__gps__emvUpdateParam__emvUpdateParam_tol02{
    NSLog(@"恭喜你，成功了5");
    
    
}
-(void)AUTOTEST__gps__emvUpd__emvUpdateParam_tol02{
    NSLog(@"恭喜你，成功了5");
    
}

@end
