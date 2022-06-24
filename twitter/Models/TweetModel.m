//
//  TweetModel.m
//  twitter
//
//  Created by maxfierro on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetModel.h"
#import "UserModel.h"
#import "TweetUtils.h"

@implementation TweetModel

- (instancetype)initWithDictionary:(NSDictionary *)tweetDictionary {
    self = [super init];
    if (self) {
        NSDictionary *originalTweet = tweetDictionary[@"retweeted_status"];
        if (originalTweet != nil) {
            NSDictionary *userDictionary = tweetDictionary[@"user"];
            self.whoRetweetedMe = [[UserModel alloc] initWithDictionary:userDictionary];
            tweetDictionary = originalTweet;
        }
        self.idString = tweetDictionary[@"id_str"];
        self.textContent = tweetDictionary[@"text"];
        self.favoriteCount = tweetDictionary[@"favorite_count"];
        self.retweetCount = tweetDictionary[@"retweet_count"];
        self.replyCount = tweetDictionary[@"reply_count"];
        self.isRetweeted = [tweetDictionary[@"retweeted"] boolValue];
        self.isFavorited = [tweetDictionary[@"favorited"] boolValue];
        self.authorUserModel = [[UserModel alloc] initWithDictionary:tweetDictionary[@"user"]];
        self.dateCreatedString = [TweetUtils formatToShortDate:tweetDictionary[@"created_at"]];
    }
    return self;
}

@end
