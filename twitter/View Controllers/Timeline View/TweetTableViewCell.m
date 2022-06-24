//
//  TweetTableViewCell.m
//  twitter
//
//  Created by maxfierro on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetTableViewCell.h"

@implementation TweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)refreshCellUI {
    UserModel *myAuthor = self.myTweet.authorUserModel;
    
    NSString *imageURLString = self.myTweet.authorUserModel.profilePictureURLString;
    NSURL *imageURL = [NSURL URLWithString:imageURLString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
    self.userNameAndDate.text = [NSString stringWithFormat:@"@%@ - %@", myAuthor.screenName, self.myTweet.dateCreatedString];
    self.profilePictureImage.image = [UIImage imageWithData:imageData];
    self.displayName.text = self.myTweet.authorUserModel.userName;
    self.tweetContents.text = self.myTweet.textContent;
    
    self.replyCountLabel.text = [self.myTweet.replyCount stringValue];
    self.favoriteCountLabel.text = [self.myTweet.favoriteCount stringValue];
    self.retweetCountLabel.text = [self.myTweet.retweetCount stringValue];

    self.userNameAndDate.textColor = [UIColor lightGrayColor];
    self.profilePictureImage.layer.cornerRadius = self.profilePictureImage.frame.size.width / 2;
    self.profilePictureImage.clipsToBounds = YES;
    
//    self.replyButton.titleLabel.text = nil;
//    self.retweetButton.titleLabel.text = nil;
//    self.messageButton.titleLabel.text = nil;
//    self.favoriteButton.titleLabel.text = nil;
    
    if (self.myTweet.isRetweeted) {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    } else {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    }
    
    if (self.myTweet.isFavorited) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    } else {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
    
}

- (IBAction)didTapMessage:(id)sender {
    [self refreshCellUI];
}

- (IBAction)didTapReply:(id)sender {
    [self refreshCellUI];
}

- (IBAction)didTapRetweet:(id)sender {
    if (self.myTweet.isRetweeted) {
        [[APIManager shared] postRequestToEndpoint:[NSString stringWithFormat:@"1.1/statuses/unretweet/%@.json", self.myTweet.idString]
                                 parametersPayload:@{@"id": self.myTweet.idString}
                                        completion:^(TweetModel *tweet, NSError *error){
            if(error){
                  NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.textContent);
             }
         }];
        self.myTweet.isRetweeted = NO;
        self.myTweet.retweetCount = [TweetUtils sumIntToNSNumber:self.myTweet.retweetCount integer:-1];
    } else {
        [[APIManager shared] postRequestToEndpoint:[NSString stringWithFormat:@"1.1/statuses/retweet/%@.json", self.myTweet.idString]
                                 parametersPayload:@{@"id": self.myTweet.idString}
                                        completion:^(TweetModel *tweet, NSError *error){
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully retweeted the following Tweet: %@", tweet.textContent);
             }
         }];
        self.myTweet.isRetweeted = YES;
        self.myTweet.retweetCount = [TweetUtils sumIntToNSNumber:self.myTweet.retweetCount integer:1];
    }
    [self refreshCellUI];
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.myTweet.isFavorited) {
        [[APIManager shared] postRequestToEndpoint:@"1.1/favorites/destroy.json"
                                 parametersPayload:@{@"id": self.myTweet.idString}
                                        completion:^(TweetModel *tweet, NSError *error){
            if(error){
                  NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.textContent);
             }
         }];
        self.myTweet.isFavorited = NO;
        self.myTweet.favoriteCount = [TweetUtils sumIntToNSNumber:self.myTweet.favoriteCount integer:-1];
    } else {
        [[APIManager shared] postRequestToEndpoint:@"1.1/favorites/create.json"
                                 parametersPayload:@{@"id": self.myTweet.idString}
                                        completion:^(TweetModel *tweet, NSError *error){
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.textContent);
             }
         }];
        self.myTweet.isFavorited = YES;
        self.myTweet.favoriteCount = [TweetUtils sumIntToNSNumber:self.myTweet.favoriteCount integer:1];
    }
    [self refreshCellUI];
}

@end
