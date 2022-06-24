//
//  TweetUtils.h
//  twitter
//
//  Created by maxfierro on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+AFNetworking.h"
#import "TweetModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetUtils : NSObject
+ (NSString *)formatToShortDate:(NSString *)unformattedDate;
+ (NSArray *)dictArrayToTweetArray:(NSArray *)tweetDictionaryArray;
+ (NSNumber *)sumIntToNSNumber:(NSNumber *)number integer:(int)integer;
@end

NS_ASSUME_NONNULL_END
