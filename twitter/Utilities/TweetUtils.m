//
//  TweetUtils.m
//  twitter
//
//  Created by maxfierro on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetUtils.h"
#import "TweetModel.h"

@implementation TweetUtils

+ (NSString *)formatToShortDate:(NSString *)unformattedDate {
    NSString *createdAtOriginalString = unformattedDate;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    NSDate *date = [formatter dateFromString:createdAtOriginalString];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    return [formatter stringFromDate:date];
}

+ (NSArray *)getTweetsFromDictArray:(NSArray *)tweetDictionaryArray {
    NSMutableArray *tweetArray;
    for (NSDictionary *tweetDictionary in tweetDictionaryArray) {
        TweetModel *currentTweet = [[TweetModel alloc] initWithDictionary:tweetDictionary];
        if (currentTweet != nil) {
            [tweetArray addObject:currentTweet];
        }
    }
    return tweetArray;
}



@end
