//
//  GROUD.m
//  ios_frame1
//
//  Created by 文伟 冯 on 16/2/17.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "GROUD.h"
#import "wifi.h"
#import "gps.h"
#import "Get_method.h"
#import "the_fourth_table.h"
#import "Bluetooth.h"
#import "Infrared.h"
@implementation GROUD
-(instancetype)init{
    _array = [NSMutableArray array];
    _Array1= [NSMutableArray array];
    [self ground];
    return [super init];
    
}

-(void)ground{

    wifi *view=[[wifi alloc]init];
    [_Array1 addObjectsFromArray:view.array];
    
    
    gps *view1=[[gps alloc]init];
    [_Array1 addObjectsFromArray:view1.array];


    Bluetooth *view2=[[Bluetooth alloc]init];
    [_Array1 addObjectsFromArray:view2.array];

    Infrared *view3=[[Infrared alloc]init];
    [_Array1 addObjectsFromArray:view3.array];
    
}

-(void)wifi{
    wifi *p=[[wifi alloc]init];
    SEL customSelector = NSSelectorFromString(self.hangshuM);
    [p performSelector:customSelector  withObject:nil];


}
-(void)gps{
    
    gps *p=[[gps alloc]init];
    SEL customSelector = NSSelectorFromString(self.hangshuM);
    [p performSelector:customSelector  withObject:nil];

    
}
-(void)Bluetooth{
    
    Bluetooth *p=[[Bluetooth alloc]init];
    SEL customSelector = NSSelectorFromString(self.hangshuM);
    [p performSelector:customSelector  withObject:nil];
    
    
}

-(void)Infrared{
    
    Infrared *p=[[Infrared alloc]init];
    SEL customSelector = NSSelectorFromString(self.hangshuM);
    [p performSelector:customSelector  withObject:nil];
    
    
}

@end
