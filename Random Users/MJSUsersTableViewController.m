//
//  MJSUsersTableViewController.m
//  Random Users
//
//  Created by Michael Stoffer on 11/12/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "MJSUsersTableViewController.h"
#import "MJSUser.h"

@interface MJSUsersTableViewController ()

@end

@implementation MJSUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
//    MJSUser *user = 
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
