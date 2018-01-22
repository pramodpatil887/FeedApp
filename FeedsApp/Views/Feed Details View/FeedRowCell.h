//
//  FeedRowCell.h
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedRow.h"
@interface FeedRowCell : UITableViewCell
@property UILabel *feedRowTitleLabel;
@property UILabel *feedRowDescriptionLabel;
@property UIImageView *feedRowImageView;
-(void)setDetails:(FeedRow *)feedRow;

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
@end
