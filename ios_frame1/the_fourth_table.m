//
//  the_fourth_table.m
//  ios_frame1
//
//  Created by 文伟 冯 on 16/2/1.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "the_fourth_table.h"
#import "Get_method.h"
#import "wifi.h"
#import "GROUD.h"
#import "gps.h"
@interface the_fourth_table ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation the_fourth_table

- (void)viewDidLoad {
    [super viewDidLoad];
    _qucong1=@[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
    _array=[NSMutableArray array];
    _addstring=[NSMutableArray array];
    
    self.table2to41_cell= self.table2to4_cell;
   // NSLog(@"**********%@",_table2to41_cell);
    
      _qucong=[NSMutableArray array];
    
    self.talbe4= self.table3_talbe4;
    
     GROUD *view=[[GROUD alloc]init];
    

 
        for (int s=0; s<view.Array1.count; s++){

        if ([view.Array1[s] containsObject:self.table3_talbe4]) {
            
            if ([view.Array1[s] containsObject:_table2to41_cell]) {
                
                if ([view.Array1[s] containsObject:self.table2_cell]) {
                    
                
                    NSString *a= [view.Array1[s] objectAtIndex:3];
                    [_array addObject:a];
                
             
                
           
            //NSLog(@"!!!!!!%@",_array);
            }
        }
        }
        NSSet *set = [NSSet setWithArray:_array];
        self.qucong1=[set sortedArrayUsingDescriptors:_qucong];
        
       
    }

}
    
    
//    for (int i=0; i<view.array.count; i++) {
//        //wifi的第i行，第3列；
//        [self.array addObject: view.array[i][3]];
//        
//        for (int j=0; j<3; j++) {
//            
//            NSString *str1=view.array[i][2];
//            NSString *str2=view.array[i][1];
//            NSString *str3=view.array[i][3];

            //_table2_cell是the_second_table的值
//            if ([str1 isEqualToString:self.table2_cell ] ) {
//              
//                if ( [str2 isEqualToString:_table2to41_cell] ){
//                    [_addstring addObject:str3];
//                  //  NSLog(@"qqq--------%@",str3);
//                    NSSet *set = [NSSet setWithArray:_addstring];
//                 self.qucong=[set sortedArrayUsingDescriptors:_qucong1];
//                }
          //  }
            
       // }
        
    



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

     return _qucong1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    NSMutableArray *mm = [[NSMutableArray alloc] init];
    
    mm = _qucong1[indexPath.row];
    cell.textLabel.text = mm;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *table44  =cell.textLabel.text;
    NSString *str = self.talbe4;
    NSString *str2=@"__";
    NSString  *str3 = [str stringByAppendingString:str2];
     NSString  *str4 = [str3 stringByAppendingString:self.table2to41_cell];
     NSString  *str5 = [str4 stringByAppendingString:str2];
    NSString  *str6 = [str5 stringByAppendingString:self.table2_cell];
    NSString  *str7 = [str6 stringByAppendingString:str2];
    NSString  *str8 = [str7 stringByAppendingString:table44];
    [self cellclick:str8];
}

-(void) cellclick:(NSString *)methodName1
{
    NSString *k=self.table3_talbe4;
    GROUD *p=[[GROUD alloc]init];
    
    p.hangshuM=methodName1;
    SEL customSelector = NSSelectorFromString(k);
    [p performSelector:customSelector  withObject:nil];
    
}


@end
