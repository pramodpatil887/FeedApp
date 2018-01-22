//
//  FeedRow.h
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedRow : NSObject
@property NSString *title;
@property NSString *descriptionDetails;
@property NSString *imageURL;
-(FeedRow *)initWithDetails:(NSDictionary *)detailsDict;
@end
