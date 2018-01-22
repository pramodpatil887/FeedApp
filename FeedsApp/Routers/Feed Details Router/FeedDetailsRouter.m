//
//  FeedRouter.m
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import "FeedDetailsRouter.h"
#import "FeedDetailsPresenter.h"
#import "FeedDetailsView.h"

@implementation FeedDetailsRouter
+(UIViewController *)createFeedDetailsModule
{
    FeedDetailsView *feedDetailsView = [[FeedDetailsView alloc] init];
    FeedDetailsPresenter *feedDetailsPresenter = [[FeedDetailsPresenter alloc] init];
    FeedDetailsRouter *feedDetailsRouter = [[FeedDetailsRouter alloc] init];
    FeedDetailsInteractor *feedDetailsInteracter = [[FeedDetailsInteractor alloc] init];
    
    feedDetailsView.feedDetailsPresenter = feedDetailsPresenter;
    
    feedDetailsPresenter.feedDetailsView = feedDetailsView;
    feedDetailsPresenter.feedDetailsInteracter = feedDetailsInteracter;
    feedDetailsPresenter.feedDetailsRouter = feedDetailsRouter;
    
    feedDetailsInteracter.feedDetailsPresenter = feedDetailsPresenter;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:feedDetailsView];
    return navController;
}
@end
