//
//  TweetModel.h
//  twitter
//
//  Created by maxfierro on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetModel : NSObject

@property (nonatomic, strong) NSString *idString;
@property (nonatomic, strong) NSString *textContent;
@property (nonatomic) int favoriteCount;
@property (nonatomic) BOOL isFavorited;
@property (nonatomic) int retweetCount;
@property (nonatomic) BOOL isRetweeted;
@property (nonatomic, strong) UserModel *authorUserModel;
@property (nonatomic, strong) NSString *dateCreatedString;
@property (nonatomic, strong) UserModel *whoRetweetedMe;

- (instancetype)initWithDictionary:(NSDictionary *)tweetDictionary;

@end

NS_ASSUME_NONNULL_END
