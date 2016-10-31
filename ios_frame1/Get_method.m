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
        if (_m.count>=4) {
            [_array addObject: _m];
            //  NSLog(@"pppp%@",_array);
            
        }
    }
}

//************************************************************************************
//************************************************************************************



-(void)wifi__AUTOTEST__emvUpdateParamq__emvUpdateParam_fun01{
    
    printf("恭喜你，");
    
}


-(void)wifi__AUTOTEST__emvUpdateParamq__emvUpdateParam_fun02{
    
    NSLog(@"恭喜你，成功了2");
    
}

-(void)wifi__MANTEST__emvUpdateParam__emvUpdateParam_fun01{
    
    NSLog(@"恭喜你，成功了3");
    
}

-(void)wifi__MANTEST__emvUpdateParam__emvUpdateParam_fun02{
    
    NSLog(@"恭喜你，成功了4");
    
}
-(void)wifi__MANTEST__emvUpdateParam__emvUpdateParam_tol01{
    NSLog(@"恭喜你，成功了5");
    
}


-(void)wifi__MANTEST__emvUpdateParam__emvUpdateParam_tol02{
    NSLog(@"恭喜你，成功了6");
    
    
}
-(void)wifi__SEMI_AUTOTEST__emvUpd__emvUpdateParam_tol01{
    NSLog(@"恭喜你，成功了7");
    
}
-(void)wifi__SEMI_AUTOTEST__emvUpd__emvUpdateParam_tol02{
    NSLog(@"恭喜你，成功了8");
    
}

@end


