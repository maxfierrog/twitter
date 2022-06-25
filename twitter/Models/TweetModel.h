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

@property (nonatomic) bool isFavorited;
@property (nonatomic) bool isRetweeted;
@property (nonatomic) NSNumber *retweetCount;
@property (nonatomic) NSNumber *replyCount;
@property (nonatomic) NSNumber *favoriteCount;
@property (nonatomic, strong) UserModel *authorUserModel;
@property (nonatomic, strong) UserModel *whoRetweetedMe;
@property (nonatomic, strong) NSString *dateCreatedString;
@property (nonatomic, strong) NSString *idString;
@property (nonatomic, strong) NSString *textContent;
@property (nonatomic, strong) NSDate *dateCreated;

- (instancetype)initWithDictionary:(NSDictionary *)tweetDictionary;

@end

NS_ASSUME_NONNULL_END
