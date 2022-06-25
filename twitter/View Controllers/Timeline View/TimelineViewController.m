//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *timelineTableView;
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timelineTableView.delegate = self;
    self.timelineTableView.dataSource = self;
    [ViewControllerUtils getRefreshControl:self refreshSelector:@selector(doRefresh:) UIView:self.timelineTableView];
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (error) {
            NSLog(@"Error getting home timeline: %@", error.localizedDescription);
        } else if (tweets) {
            NSLog(@"Successfully fetched timeline tweets.");
            self.tweetArray = [NSMutableArray arrayWithArray:tweets];
            [self.timelineTableView reloadData];
        } else if (tweets == nil && error == nil) {
            NSLog(@"No tweets available.");
        }
    }];
}

- (void)doRefresh:(UIRefreshControl *)refreshControl {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (error) {
            NSLog(@"Error getting home timeline: %@", error.localizedDescription);
        } else if (tweets) {
            self.tweetArray = [NSMutableArray arrayWithArray:tweets];
            [self.timelineTableView reloadData];
            [refreshControl endRefreshing];
        } else {
            NSLog(@"No tweets available.");
        }
    }];
}

- (IBAction)didTapLogOut:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}

- (void)didTweet:(TweetModel *)tweet {
    [self.tweetArray addObject:tweet];
    [self.timelineTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetTableViewCell *tweetCell = [tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell"];
    tweetCell.myTweet = self.tweetArray[indexPath.row];
    [tweetCell refreshCellUI];
    return tweetCell;
}

#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([sender isKindOfClass:[UIBarButtonItem class]]) {
         UINavigationController *navigationController = [segue destinationViewController];
         ComposeViewController *composeController = (ComposeViewController *)navigationController.topViewController;
         composeController.delegate = self;
     } else if ([sender isKindOfClass:[UITableViewCell class]]) {
         NSIndexPath *cellIndexPath = [self.timelineTableView indexPathForCell:sender];
         TweetModel *clickedOnTweet = self.tweetArray[cellIndexPath.row];
         UINavigationController *navigationController = [segue destinationViewController];
         TweetDetailsViewController *tweetDetailsVC = (TweetDetailsViewController *)navigationController.topViewController;
         tweetDetailsVC.delegate = sender;
         tweetDetailsVC.myTweet = clickedOnTweet;
     }
}

@end
