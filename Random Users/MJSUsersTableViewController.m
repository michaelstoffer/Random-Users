//
//  MJSUsersTableViewController.m
//  Random Users
//
//  Created by Michael Stoffer on 11/12/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "MJSUsersTableViewController.h"
#import "MJSUserDetailViewController.h"
#import "MJSUser.h"
#import "Random_Users-Swift.h"

@interface MJSUsersTableViewController ()

@property (nonatomic) NSArray<MJSUser *> *users;

@end

@implementation MJSUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MJSUserController.sharedController fetchUsersWithCompletion:^(NSArray<MJSUser *> *users, NSError *error) {
        if (error) {
            NSLog(@"Error returning users: %@", error);
        }
        
        self.users = users;
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
    MJSUser *user = [self.users objectAtIndex:indexPath.row];
    cell.textLabel.text = user.name;
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:user.thumbnailImage]];
    cell.imageView.image = [[UIImage alloc] initWithData:imageData];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        MJSUserDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.user = [self.users objectAtIndex:indexPath.row];
    }
}

@end
