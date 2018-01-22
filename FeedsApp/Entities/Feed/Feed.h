//
//  Feed.h
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject
@property NSString *title;
@property NSMutableArray *rows;
-(Feed *)initWithDetails:(NSDictionary *)detailsDict;
@end
