//
//  Feed.m
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import "Feed.h"
#import "FeedRow.h"

@implementation Feed
-(Feed *)initWithDetails:(NSDictionary *)detailsDict;
{
    NSString *title = detailsDict[@"title"];
    self.title = title;
    self.rows = [[NSMutableArray alloc] init];
    NSArray *rowsArray = detailsDict[@"rows"];
    for (NSDictionary *feedRosDetailsDict in rowsArray ) {
        FeedRow *feedRow = [[FeedRow alloc] initWithDetails:feedRosDetailsDict];
        if (feedRow) {
            [self.rows addObject:feedRow];
        }
    }
    return  self;
}
@end
