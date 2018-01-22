//
//  FeedInteractor.m
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import "FeedDetailsInteractor.h"
#import "Constants.h"
@implementation FeedDetailsInteractor
#pragma mark - Retrieving Feed Details
-(void)retrieveFeedWithCompletionHandler:(void (^)(Feed *feedDetails, NSError *error))completionHandler
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:FEED_URL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSError *jsonError = nil;
            //converting data into valid encoding format
            NSString *responseString = [[[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] stringByReplacingOccurrencesOfString:@"\t" withString:@""] stringByReplacingOccurrencesOfString:@"\0" withString:@""];
            NSData *resData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
            //Parsing response
            NSMutableDictionary *feedDetails = [NSJSONSerialization JSONObjectWithData:resData options:0 error:&jsonError];
            
            if (feedDetails) {
                Feed *feed = [[Feed alloc] initWithDetails:feedDetails];
                completionHandler(feed,nil);
            }else if (jsonError) {
                completionHandler(nil,jsonError);
            }
            else{
                completionHandler(nil,error);
            }
        }];
        [dataTask resume];
    });
}

@end
