//
//  the_third_table.m
//  ios_frame1
//
//  Created by fengwenwei on 16/2/1.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "the_third_table.h"
#import "Get_method.h"
#import "the_fourth_table.h"
#import "wifi.h"
#import "GROUD.h"
@interface the_third_table ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation the_third_table

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [NSMutableArray array];
    _qucong = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
    _qucong1 = [NSMutableArray array];
    _shuzu =[NSMutableArray array];
    _addstring =[NSMutableArray array];

    _table2to4_cell =_table2_cell;
    

    self.table3_talbe4 =self.table2_talbe3;
 
    
   GROUD *view =[[GROUD alloc]init];
   // NSLog(@"~~~~~~~~%@",self.table2_talbe3);
    
   
        for (int s=0; s<view.Array1.count; s++){
             if ([view.Array1[s] containsObject:self.table2_talbe3]) {
                 if ([view.Array1[s] containsObject:_table2_cell]) {
                     
                     NSString *a= [view.Array1[s] objectAtIndex:2];
                     [_array addObject:a];
                 
          
        }
        }
                  _set = [NSSet setWithArray:_array];
           self.qucong1=[_set sortedArrayUsingDescriptors:_qucong];
        }

}

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
    
    _table2_cell=cell.textLabel.text;
   // NSLog(@"---qqqq-------%@",cell.textLabel.text);
    
    the_fourth_table *oneController = [[self storyboard]instantiateViewControllerWithIdentifier:@"viewfirst2"];
    
    oneController.table2_cell=self.table2_cell;
    oneController.table2to4_cell=_table2to4_cell;
    oneController.table3_talbe4=self.table3_talbe4;
    
    
    [[self navigationController] pushViewController:oneController animated:YES];
    
    
}

@end
