//
//  APIManager.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "BDBOAuth1SessionManager.h"
#import "BDBOAuth1SessionManager+SFAuthenticationSession.h"
#import "TweetUtils.h"
#import "TweetModel.h"

@interface APIManager : BDBOAuth1SessionManager

+ (instancetype)shared;
- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion;
- (void)postStatusWithText:(NSString *)text completion:(void (^)(TweetModel *sentTweet, NSError *error))completion;
- (void)replyToTweet:(TweetModel *)tweetToGetReply completion:(void (^)(TweetModel *tweet, NSError *error))completion;
- (void)unreplyToTweet:(TweetModel *)tweetToLoseReply completion:(void (^)(TweetModel *tweet, NSError *error))completion;
- (void)postRequestToEndpoint:(NSString *)URLString
            parametersPayload:(NSDictionary *)parameters
                   completion:(void (^)(TweetModel *tweet, NSError *error))completion;

@end
