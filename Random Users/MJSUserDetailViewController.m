//
//  MJSUserDetailViewController.m
//  Random Users
//
//  Created by Michael Stoffer on 11/12/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "MJSUserDetailViewController.h"
#import "MJSUser.h"

#import "Random_Users-Swift.h"

void *KVOContext = &KVOContext;

@interface MJSUserDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation MJSUserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MJSUserController.sharedController fillInUserWithUser:self.user];
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
        [_user removeObserver:self forKeyPath:@"phone" context:KVOContext];
        [_user removeObserver:self forKeyPath:@"email" context:KVOContext];
        [_user removeObserver:self forKeyPath:@"thumbnailImage" context:KVOContext];
        [_user removeObserver:self forKeyPath:@"largeImage" context:KVOContext];
        
        _user = user;
        
        [_user addObserver:self forKeyPath:@"phone" options:NSKeyValueObservingOptionInitial context:KVOContext];
        [_user addObserver:self forKeyPath:@"email" options:NSKeyValueObservingOptionInitial context:KVOContext];
        [_user addObserver:self forKeyPath:@"thumbnailImage" options:NSKeyValueObservingOptionInitial context:KVOContext];
        [_user addObserver:self forKeyPath:@"largeImage" options:NSKeyValueObservingOptionInitial context:KVOContext];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == KVOContext) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
