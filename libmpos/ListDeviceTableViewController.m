//
//  ListDeviceTableViewController.m
//  ios_frame1
//
//  Created by fengwenwei on 16/2/18.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

//
//  ListDeviceTableViewController.m
//  SDK_Demo
//
//  Created by owen on 16/2/1.
//  Copyright © 2016年 newpos. All rights reserved.
//

#import "ListDeviceTableViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "IRequestPosInteface.h"




@interface ListDeviceTableViewController ()<UITableViewDataSource, UITableViewDataSource, CBCentralManagerDelegate,CBPeripheralDelegate, UIAlertViewDelegate>


@property (nonatomic, strong) NSMutableArray        *discoverPeripherals;
@property (nonatomic, strong) CBCentralManager      *manager;

@end

@implementation ListDeviceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
    _discoverPeripherals = [[NSMutableArray alloc] init];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    
    switch (central.state) {
        case CBCentralManagerStateUnknown:
            //NSLog(@">>>CBCentralManagerStateUnknown");
            break;
        case CBCentralManagerStateResetting:
            //NSLog(@">>>CBCentralManagerStateResetting");
            break;
        case CBCentralManagerStateUnsupported:
            //NSLog(@">>>CBCentralManagerStateUnsupported");
            break;
        case CBCentralManagerStateUnauthorized:
            //NSLog(@">>>CBCentralManagerStateUnauthorized");
            break;
        case CBCentralManagerStatePoweredOff:
            //NSLog(@">>>CBCentralManagerStatePoweredOff");
            break;
        case CBCentralManagerStatePoweredOn:
            //NSLog(@">>>CBCentralManagerStatePoweredOn");
            
            [central scanForPeripheralsWithServices:nil options:nil];
            
            break;
        default:
            break;
    }
    
}


-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    //移除掉相同的蓝牙
    if(_discoverPeripherals.count==0)
    {
        [_discoverPeripherals addObject:peripheral];
    }
    else
    {
        BOOL isHave=NO;
        for ( CBPeripheral *pe in _discoverPeripherals )
        {
            if (pe.identifier == peripheral.identifier)
            {
                isHave=YES;
            }
        }
        if(isHave == NO)
        {
            [_discoverPeripherals addObject:peripheral];
        }
    }
    [self.tableView reloadData];
    
}









#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_discoverPeripherals[indexPath.row] == nil)
        return;
    
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor grayColor];
    view.alpha = 0.5;
    [self.view addSubview:view];
    
    
    CBPeripheral *peripheral;
    peripheral = _discoverPeripherals[indexPath.row];
    NSString *uuid = [[NSString alloc] init];
    uuid = peripheral.description;
    NSRange range;
    range = [uuid rangeOfString:@"identifier = "];
    if (range.location != NSNotFound)
    {
        uuid = [uuid substringFromIndex:range.location + range.length ];
        NSRange range;
        range = [uuid rangeOfString:@","];
        if (range.location != NSNotFound)
        {
            uuid = [uuid substringToIndex:range.location];
        }
        
    }
    
    
    IRequestPosInteface *pos = [IRequestPosInteface sharedIRequestPosInteface];
    if ([pos requestConnectState] == YES)
    {
        [pos requestCloseDevice:^{
            [pos requestOpenDevice:1 andParam:uuid andTimeOut:5000 success:^(BOOL blnIsOpenSuc) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"打开设备" message:@"成功打开设备" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alertView show];
            } error:^(NSString *strStausCode, NSString *strMsgInfo) {
                ;
            }];
        } error:^(NSString *strStausCode, NSString *strMsgInfo)
         {
             ;
         }];
    }
    else
    {
        [pos requestOpenDevice:1 andParam:uuid andTimeOut:5000 success:^(BOOL blnIsOpenSuc) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"打开设备" message:@"成功打开设备" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        } error:^(NSString *strStausCode, NSString *strMsgInfo) {
            ;
        }];
    }
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _discoverPeripherals.count;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = [_discoverPeripherals[indexPath.row] name];
    
    return cell;
}





/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
