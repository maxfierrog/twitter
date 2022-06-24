//
//  ViewControllerUtils.m
//  twitter
//
//  Created by maxfierro on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ViewControllerUtils.h"

@implementation ViewControllerUtils

+ (UIAlertController *)getNetworkingAlertController:(NSString *)displayMessage action:(void (^)(void))doWhenClickOK {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:displayMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        doWhenClickOK();
    }];
    [alert addAction:ok];
    return alert;
}

+ (UIRefreshControl *)getRefreshControl:(UIViewController *)viewController refreshSelector:(SEL)refreshSelector UIView:(UIView *)UIView {
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:viewController action:refreshSelector forControlEvents:UIControlEventValueChanged];
    [UIView insertSubview:refreshControl atIndex:0];
    return refreshControl;
}

@end
