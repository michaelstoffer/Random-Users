//
//  MJSUserDetailViewController.m
//  Random Users
//
//  Created by Michael Stoffer on 11/12/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "MJSUserDetailViewController.h"

@interface MJSUserDetailViewController ()


@end

@implementation MJSUserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)setUser:(MJSUser *)user
{
    if (_user != user) {
        _user = user;
        [self updateViews];
    }
}

- (void)updateViews
{
    if (!self.isViewLoaded || !self.user) { return; }
}

@end
