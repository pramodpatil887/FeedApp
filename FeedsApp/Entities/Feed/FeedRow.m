//
//  FeedRow.m
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import "FeedRow.h"

@implementation FeedRow

-(FeedRow *)initWithDetails:(NSDictionary *)detailsDict
{
    
    if ([self isAnyDataAvailable:detailsDict]) {
        NSString *title = [self setNilIfNullString:detailsDict[@"title"]];
        NSString *description = [self setNilIfNullString:detailsDict[@"description"]];
        NSString *imageURL = [self setNilIfNullString:detailsDict[@"imageHref"]];
        self.title = title;
        self.descriptionDetails = description;
        self.imageURL = imageURL;
        return self;
    }
    return nil;
}

-(BOOL)isAnyDataAvailable:(NSDictionary *)detailsDict
{
    NSString *title = [self setNilIfNullString:detailsDict[@"title"]];
    NSString *description = [self setNilIfNullString:detailsDict[@"description"]];
    NSString *imageURL = [self setNilIfNullString:detailsDict[@"imageHref"]];
    if (title || description || imageURL) {
        return YES;
    }
    return NO;
}
-(id)setNilIfNullString:(NSString *)stringValue
{
    if (stringValue == nil || stringValue == (id)[NSNull null] || [stringValue isKindOfClass:[NSNull class]]) {
        return nil;
        
    }
    return stringValue;
}

@end
