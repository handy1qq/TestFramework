//
//  the_first_table.m
//  ios_frame1
//
//  Created by fengwenwei on 16/1/31.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "the_first_table.h"
#import "Get_method.h"
#import "the_second_table.h"
#import "wifi.h"
#import "GROUD.h"
@interface the_first_table ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation the_first_table

- (void)viewDidLoad {
    [super viewDidLoad];
    _array=[NSMutableArray array];
    _array1=[NSMutableArray array];
      _qucong=[NSMutableArray array];
     _qucong1=[NSMutableArray array];
    
   GROUD *view=[[GROUD alloc]init];
    
    
    
    
    int y=sizeof(view.Array1);
    int t=view.Array1.count;

      NSLog(@"!!!!!!!!!!%@",view.array);
  // NSLog(@"!!!!!!!!!!%@",view.Array1[47]);
   // NSLog(@"!!!!!!!!!!%d,%d",t,y);
    
    
        for (int s=0; s<view.Array1.count; s++) {
        
           NSString *a= [view.Array1[s] objectAtIndex:0];
            NSLog(@"!!!!!!!!!!%@",a);
            [_array1 addObject:a];
        }

    NSSet *set = [NSSet setWithArray:_array1];
    _qucong=[set sortedArrayUsingDescriptors:_qucong1];
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.qucong.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    NSMutableArray *mm = [[NSMutableArray alloc] init];
    mm = self.qucong[indexPath.row];
    cell.textLabel.text = mm;
    //_string=cell.textLabel.text;
    //  NSLog(@"%@",_string);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    _table1_talbe2=cell.textLabel.text;

    //NSLog(@"%@",cell.textLabel.text);
    
    the_second_table *oneController = [[self storyboard]instantiateViewControllerWithIdentifier:@"viewfirst"];
    oneController.table1_talbe2=self.table1_talbe2;
   
    [[self navigationController] pushViewController:oneController animated:YES];
    
    
}

@end
