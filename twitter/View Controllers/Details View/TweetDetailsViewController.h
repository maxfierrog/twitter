//
//  TweetThreadViewController.h
//  twitter
//
//  Created by maxfierro on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetModel.h"
#import "APIManager.h"
#import "DateTools.h"
#import "TimelineViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TweetDetailsViewDelegate
- (void)closedTweetDetailView;
@end

@interface TweetDetailsViewController : UIViewController
@property TweetModel *myTweet;
@property (nonatomic, weak) id<TweetDetailsViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
