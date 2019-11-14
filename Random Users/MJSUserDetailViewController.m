//
//  MJSUserDetailViewController.m
//  Random Users
//
//  Created by Michael Stoffer on 11/12/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "MJSUserDetailViewController.h"
#import "MJSUser.h"

@interface MJSUserDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation MJSUserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.isViewLoaded || !self.user) { return; }
    
    self.nameLabel.text = self.user.name;
    self.phoneLabel.text = self.user.phone;
    self.emailLabel.text = self.user.email;
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.user.largeImage]];
    self.imageView.image = [[UIImage alloc] initWithData:imageData];
}

- (void)setUser:(MJSUser *)user
{
    if (_user != user) {
        _user = user;
        [self updateViews];
    }
}

@end
