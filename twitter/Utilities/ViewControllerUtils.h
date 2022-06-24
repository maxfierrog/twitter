//
//  ViewControllerUtils.h
//  twitter
//
//  Created by maxfierro on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerUtils : NSObject
+ (UIAlertController *)getNetworkingAlertController:(NSString *)displayMessage action:(void (^)(void))doWhenClickOK;
+ (UIRefreshControl *)getRefreshControl:(UIViewController *)viewController refreshSelector:(SEL)refreshSelector UIView:(UIView *)UIView;
@end

NS_ASSUME_NONNULL_END
