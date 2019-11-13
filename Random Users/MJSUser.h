//
//  MJSUser.h
//  Random Users
//
//  Created by Michael Stoffer on 11/12/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJSUser : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *name;
@property (nonatomic, copy, readonly, nonnull) NSString *phone;
@property (nonatomic, copy, readonly, nonnull) NSString *email;
@property (nonatomic, copy, readonly, nonnull) NSURL *thumbnailImage;
@property (nonatomic, copy, readonly, nonnull) NSURL *largeImage;

- (nonnull instancetype)initWithName:(nonnull NSString *)name
                               phone:(nonnull NSString *)phone
                               email:(nonnull NSString *)email
                      thumbnailImage:(nonnull NSURL *)thumbnailImage
                          largeImage:(nonnull NSURL *)largeImage;

- (nullable instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end
