//
//  TweetDetailsViewController.m
//  twitter
//
//  Created by maxfierro on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetDetailsViewController.h"
#import "TweetTableViewCell.h"
#import "TweetModel.h"

@interface TweetDetailsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tweetRepliesTableView;
@end

@implementation TweetDetailsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetRepliesTableView.delegate = self;
    self.tweetRepliesTableView.dataSource = self;
    
    // TODO: Use self.myTweet to create a rudimentary details page for the requirement.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetReplyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetTableViewCell *tweetCell = [tableView dequeueReusableCellWithIdentifier:@"TweetReplyTableViewCell"];
    tweetCell.myTweet = self.tweetReplyArray[indexPath.row];
    [tweetCell refreshUI];
    return tweetCell;
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
