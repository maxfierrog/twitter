//
//  TweetUtils.h
//  twitter
//
//  Created by maxfierro on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TweetUtils : NSObject

+ (NSString *)formatToShortDate:(NSString *)unformattedDate;
+ (NSArray *)getTweetsFromDictArray:(NSArray *)tweetDictionaryArray;

@end

NS_ASSUME_NONNULL_END
