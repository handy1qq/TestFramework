//
//  the_second_table.m
//  ios_frame1
//
//  Created by fengwenwei on 16/2/1.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "the_second_table.h"
#import "the_third_table.h"
#import "Get_method.h"
#import "wifi.h"
#import "GROUD.h"
@interface the_second_table ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation the_second_table

- (void)viewDidLoad {
    [super viewDidLoad];
    _array1 = [NSMutableArray array];
    _array = [NSMutableArray array];
    _qucong = [NSMutableArray array];
    _qucong1 = [NSMutableArray array];
    GROUD *view=[[GROUD alloc]init];
    

    
    self.table2_talbe3=self.table1_talbe2;
   // int y=sizeof(view.array);
  //  int t=view.Array1.count;
   // NSLog(@"~~~~~~~~%@",self.table1_talbe2);
    
  
        
        for (int s=0; s<view.Array1.count; s++){
        if ([view.Array1[s] containsObject:self.table1_talbe2]) {
//            
         [ _array addObject:[view.Array1[s] objectAtIndex:1]];
//            [_array addObject:a];
//             NSLog(@"~~~~~~~~%@",view.Array1[s]);
//            NSLog(@"!!!!!!!!%@",_array);
       }
        }
        NSSet *set = [NSSet setWithArray:_array];
        self.qucong1 = [set sortedArrayUsingDescriptors:_qucong];
    
    
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return _qucong1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    NSMutableArray *mm = [[NSMutableArray alloc] init];
    mm = self.qucong1[indexPath.row];
   cell.textLabel.text = mm;
  //  NSLog(@"`````````````%@",cell.textLabel.text );
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    _table2_cell=cell.textLabel.text;
 //  NSLog(@"----------%@",cell.textLabel.text);
    
    the_third_table *oneController = [[self storyboard]instantiateViewControllerWithIdentifier:@"viewfirst1"];
    
    oneController.table2_cell=self.table2_cell;
    oneController.table2_talbe3=self.table2_talbe3;

    [[self navigationController] pushViewController:oneController animated:YES];
    
    
}


@end
