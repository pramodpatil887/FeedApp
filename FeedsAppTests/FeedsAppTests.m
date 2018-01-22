//
//  FeedsAppTests.m
//  FeedsAppTests
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FeedDetailsInteractor.h"
#import "FeedRowCell.h"
@interface FeedsAppTests : XCTestCase
{
    NSURL *cellImageURL;
}
@property FeedDetailsInteractor *feedDetailsInteractor;
@property FeedRowCell *feedCell;
@end

@implementation FeedsAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _feedDetailsInteractor = [[FeedDetailsInteractor alloc] init];
    cellImageURL = [NSURL URLWithString:@"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
-(void)testRetievesFeedDetails
{
    //Testing Feed is retieving or not
    [_feedDetailsInteractor retrieveFeedWithCompletionHandler:^(Feed *feedDetails, NSError *error) {
        XCTAssertNil(feedDetails,"Feed details getting nil");
    }];
}
-(void)testLoadImage
{
    [_feedCell downloadImageWithURL:cellImageURL completionBlock:^(BOOL succeeded, UIImage *image) {
        XCTAssertTrue(succeeded,"Image dowloaded successfully.");
    }];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
