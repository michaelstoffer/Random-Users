//
//  MJSUser.m
//  Random Users
//
//  Created by Michael Stoffer on 11/12/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "MJSUser.h"

@implementation MJSUser

- (instancetype)initWithName:(NSString *)name
                       phone:(NSString *)phone
                       email:(NSString *)email
              thumbnailImage:(NSURL *)thumbnailImage
                  largeImage:(NSURL *)largeImage
{
    if (self = [super init]) {
        _name = name.copy;
        _phone = phone.copy;
        _email = email.copy;
        _thumbnailImage = thumbnailImage.copy;
        _largeImage = largeImage.copy;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = [NSString stringWithFormat:@"%@ %@", dictionary[@"name"][@"first"], dictionary[@"name"][@"last"]];
    NSString *phone = dictionary[@"phone"];
    NSString *email = dictionary[@"email"];
    NSURL *thumbnailImage = dictionary[@"picture"][@"thumbnail"];
    NSURL *largeImage = dictionary[@"picture"][@"large"];
        
    return [self initWithName:name phone:phone email:email thumbnailImage:thumbnailImage largeImage:largeImage];
}

@end