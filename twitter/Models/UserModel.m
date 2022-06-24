//
//  UserModel.m
//  twitter
//
//  Created by maxfierro on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.userName = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profilePictureURLString = dictionary[@"profile_image_url_https"];
    }
    return self;
}

@end
