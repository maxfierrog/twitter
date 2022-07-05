# Project 2 - Twitter

Twitter is a basic app to read and compose tweets using the [Twitter API](https://apps.twitter.com/).

## User Stories

The following **core** features are completed:

- [X] See an app icon in the home screen and a styled launch screen
- [X] Be able to log in using their Twitter account
- [X] See at latest the latest 20 tweets for a Twitter account in a Table View
- [X] Be able to refresh data by pulling down on the Table View
- [X] Be able to like and retweet from their Timeline view
- [X] Only be able to access content if logged in
- [X] Each tweet should display user profile picture, username, screen name, tweet text, timestamp, as well as buttons and labels for favorite, reply, and retweet counts.
- [X] Compose and post a tweet from a Compose Tweet view, launched from a Compose button on the Nav bar.
- [X] See Tweet details in a Details view
- [X] App should render consistently all views and subviews in recent iPhone models and all orientations
- [X] Be able to **unlike** or **un-retweet** by tapping a liked or retweeted Tweet button, respectively. (Doing so will decrement the count for each)

Here are some things I might do in the future:

- [ ] Click on links that appear in Tweets
- [ ] See embedded media in Tweets that contain images or videos
- [ ] Reply to any Tweet (**2 points**)
  - Replies should be prefixed with the username
  - The `reply_id` should be set when posting the tweet
- [ ] See a character count when composing a Tweet (as well as a warning) (280 characters) (**1 point**)
- [ ] Load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client
- [ ] Click on a Profile image to reveal another user's profile page, including:
  - Header view: picture and tagline
  - Basic stats: #tweets, #following, #followers
- [ ] Switch between **timeline**, **mentions**, or **profile view** through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)

## Video Walkthrough

https://user-images.githubusercontent.com/69845191/175765099-0588f93e-ca9a-4fce-9ccb-ca2364db0b4b.mp4

## Credits

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
