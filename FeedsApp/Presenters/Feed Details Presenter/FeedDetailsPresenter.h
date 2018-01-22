//
//  FeedDetailsPresenter.h
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FeedDetailsView;
#import "FeedDetailsRouter.h"
#import "FeedDetailsInteractor.h"


@interface FeedDetailsPresenter : NSObject
@property FeedDetailsView *feedDetailsView;
@property FeedDetailsRouter *feedDetailsRouter;
@property FeedDetailsInteractor *feedDetailsInteracter;
-(void)viewDidLoad;
@end
