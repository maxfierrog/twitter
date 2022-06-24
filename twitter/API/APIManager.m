//
//  APIManager.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "APIManager.h"

static NSString * const baseURLString = @"https://api.twitter.com";

@interface APIManager()

@end

@implementation APIManager

+ (instancetype)shared {
    static APIManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSString *path = [[NSBundle mainBundle] pathForResource: @"Keys" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
    NSString *key = [dict objectForKey: @"consumer_Key"];
    NSString *secret = [dict objectForKey: @"consumer_Secret"];
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"consumer-key"]) {
        key = [[NSUserDefaults standardUserDefaults] stringForKey:@"consumer-key"];
    }
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"consumer-secret"]) {
        secret = [[NSUserDefaults standardUserDefaults] stringForKey:@"consumer-secret"];
    }
    self = [super initWithBaseURL:baseURL consumerKey:key consumerSecret:secret];
    if (self) {
        
    }
    return self;
}

- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion {
    [self GET:@"1.1/statuses/home_timeline.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray * _Nullable tweetDictionaries) {
       completion([TweetUtils dictArrayToTweetArray:tweetDictionaries], nil);
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       completion(nil, error);
   }];
}

- (void)postStatusWithText:(NSString *)text completion:(void (^)(TweetModel *sentTweet, NSError *error))completion {
    NSString *urlString = @"1.1/statuses/update.json";
    NSDictionary *parameters = @{@"status": text};
    
    [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable tweetDictionary) {
        TweetModel *sentTweet = [[TweetModel alloc]initWithDictionary:tweetDictionary];
        completion(sentTweet, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(nil, error);
    }];
}

- (void)favoriteTweet:(TweetModel *)tweetToBeFavorite completion:(void (^)(TweetModel *tweet, NSError *error))completion {
    NSString *urlString = @"1.1/favorites/create.json";
    NSDictionary *parameters = @{@"id": tweetToBeFavorite.idString};
    [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable tweetDictionary) {
        TweetModel *tweet = [[TweetModel alloc] initWithDictionary:tweetDictionary];
        completion(tweet, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(nil, error);
    }];
}

- (void)unfavoriteTweet:(TweetModel *)tweetToBeUnfavorite completion:(void (^)(TweetModel *tweet, NSError *error))completion {
    
}

- (void)replyToTweet:(TweetModel *)tweetToGetReply completion:(void (^)(TweetModel *tweet, NSError *error))completion {
    
}

- (void)postRequestToEndpoint:(NSString *)URLString
            parametersPayload:(NSDictionary *)parameters
                   completion:(void (^)(TweetModel *tweet, NSError *error))completion {
    [self POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable tweetDictionary) {
        TweetModel *tweet = [[TweetModel alloc] initWithDictionary:tweetDictionary];
        completion(tweet, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(nil, error);
    }];
}

@end
