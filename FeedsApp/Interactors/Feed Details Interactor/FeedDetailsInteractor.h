//
//  FeedInteractor.h
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "FeedDetailsPresenter.h"
@class FeedDetailsPresenter;

#import "Feed.h"

@interface FeedDetailsInteractor : NSObject
@property FeedDetailsPresenter *feedDetailsPresenter;
-(void)retrieveFeedWithCompletionHandler:(void (^)(Feed *feedDetails, NSError *error))completionHandler;
@end
