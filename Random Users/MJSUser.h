//
//  MJSUser.h
//  Random Users
//
//  Created by Michael Stoffer on 11/12/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJSUser : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *name;
@property (nonatomic, copy, nullable) NSString *phone;
@property (nonatomic, copy, nullable) NSString *email;
@property (nonatomic, copy, nullable) NSString *thumbnailImage;
@property (nonatomic, copy, nullable) NSString *largeImage;

- (nonnull instancetype)initWithName:(nonnull NSString *)name
                               phone:(nullable NSString *)phone
                               email:(nullable NSString *)email
                      thumbnailImage:(nullable NSString *)thumbnailImage
                          largeImage:(nullable NSString *)largeImage;

- (nullable instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end
