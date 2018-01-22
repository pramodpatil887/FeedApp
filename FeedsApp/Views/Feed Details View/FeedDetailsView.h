//
//  FeedDetailsView.h
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"
@class FeedDetailsPresenter;

@interface FeedDetailsView : UITableViewController
@property FeedDetailsPresenter *feedDetailsPresenter;
-(void)showLoading;
-(void)hideLoading;

-(void)showFeedDetails:(Feed *)feedDetails;
@end
