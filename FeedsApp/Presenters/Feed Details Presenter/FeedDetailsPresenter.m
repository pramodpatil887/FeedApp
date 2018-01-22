//
//  FeedDetailsPresenter.m
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import "FeedDetailsPresenter.h"
#import "FeedDetailsView.h"

@implementation FeedDetailsPresenter
-(void)viewDidLoad
{
    [self.feedDetailsView showLoading];
    [self.feedDetailsInteracter retrieveFeedWithCompletionHandler:^(Feed *feedDetails, NSError *error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.feedDetailsView hideLoading];
                [self.feedDetailsView showFeedDetails:feedDetails];
            });
        }
    }];
}

@end
