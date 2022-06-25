//
//  ComposeViewController.m
//  twitter
//
//  Created by maxfierro on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UIView *textViewBackground;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textViewBackground.layer.cornerRadius = self.textViewBackground.layer.borderWidth / 20;
    self.textViewBackground.clipsToBounds = YES;
}

- (IBAction)didTapPostTweet:(id)sender {
    UIAlertController *failedSend = [ViewControllerUtils getNetworkingAlertController:@"Error sending tweet, please try again" action:^{}];
    [[APIManager shared] postStatusWithText:self.tweetTextView.text completion:^(TweetModel *sentTweet, NSError *error) {
        if (error) {
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
            [self presentViewController:failedSend animated:YES completion:^{}];
        } else {
            NSLog(@"Compose Tweet Success!");
            [self dismissViewControllerAnimated:true completion:^{
                [self.delegate didTweet:sentTweet];
            }];
        }
    }];
}

- (IBAction)didTapCancelTweet:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
