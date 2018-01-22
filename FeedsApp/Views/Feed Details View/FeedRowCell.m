//
//  FeedRowCell.m
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import "FeedRowCell.h"

@implementation FeedRowCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self addSubviews];
        [self addConstraints];
        [self setStyles];
    }
    
    return self;
    return  self;
}
#pragma mark - Setting Style
-(void)setStyles
{
    [self.feedRowDescriptionLabel setFont:[UIFont systemFontOfSize:12]];
    [self.feedRowDescriptionLabel setNumberOfLines:0];
    [self.feedRowDescriptionLabel setTextColor:[UIColor darkGrayColor]];
    [self.feedRowDescriptionLabel setBackgroundColor:[UIColor whiteColor]];
    [self.feedRowDescriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
//    [self.feedRowDescriptionLabel sizeToFit];
    [self.feedRowTitleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [self.feedRowTitleLabel setNumberOfLines:0];
    [self.feedRowTitleLabel setTextColor:[UIColor blackColor]];
    [self.feedRowTitleLabel setBackgroundColor:[UIColor whiteColor]];
    [self.feedRowTitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
//    [self.feedRowTitleLabel sizeToFit];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    
}
#pragma mark - Adding Subviews
-(void)addSubviews
{
    self.feedRowImageView = [[UIImageView alloc] init];
    self.feedRowTitleLabel = [[UILabel alloc] init];
    self.feedRowDescriptionLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.feedRowImageView];
    [self.contentView addSubview:self.feedRowTitleLabel];
    [self.contentView addSubview:self.feedRowDescriptionLabel];
}
#pragma mark - Adding Constraints
-(void)addConstraintsToFeedRowImageView
{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.feedRowImageView.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:5];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:5];
   
    [NSLayoutConstraint activateConstraints:@[widthConstraint,heightConstraint,leadingConstraint,topConstraint]];
    
}

-(void)addConstraintsToFeedRowTitle
{
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowTitleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20];
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowTitleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.feedRowImageView attribute:NSLayoutAttributeTrailing multiplier:1 constant:5];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowTitleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.feedRowTitleLabel.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:5];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowTitleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.feedRowTitleLabel.superview attribute:NSLayoutAttributeTop multiplier:1 constant:5];
    [NSLayoutConstraint activateConstraints:@[leadingConstraint,trailingConstraint,topConstraint, heightConstraint]];
    
}

-(void)addConstraintsToFeedRowDescription
{
    
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowDescriptionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.feedRowImageView attribute:NSLayoutAttributeTrailing multiplier:1 constant:5];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowDescriptionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.feedRowDescriptionLabel.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:5];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowDescriptionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.feedRowTitleLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:5];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.feedRowDescriptionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.feedRowDescriptionLabel.superview  attribute:NSLayoutAttributeBottom multiplier:1 constant:5];
    [NSLayoutConstraint activateConstraints:@[leadingConstraint,trailingConstraint,topConstraint,bottomConstraint]];
    
}

-(void)addConstrintsToContentView
{
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
[NSLayoutConstraint activateConstraints:@[leadingConstraint,trailingConstraint,topConstraint,bottomConstraint]];}

-(void)addConstraints
{
    [self addConstraintsToFeedRowImageView];
    [self addConstraintsToFeedRowTitle];
    [self addConstraintsToFeedRowDescription];
//    [self addConstrintsToContentView];
    [self disableAutoresizeMask];
}
#pragma mark - Disabling Size mask
-(void)disableAutoresizeMask
{
    self.feedRowTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.feedRowDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.feedRowImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;

    
}
#pragma mark - Setting Feed Row Details
-(void)setDetails:(FeedRow *)feedRow
{
    [self.feedRowTitleLabel setText:feedRow.title];
    [self.feedRowDescriptionLabel setText:feedRow.descriptionDetails];
    [self.feedRowImageView setImage:[UIImage imageNamed:@"PlaceholderImage"]];
    if (feedRow.imageURL.length > 0) {
        NSURL *url = [NSURL URLWithString:feedRow.imageURL];
        __weak __typeof(self) weakSelf = self;

        [self downloadImageWithURL:url
                   completionBlock:^(BOOL succeeded, UIImage *image) {
                       if (succeeded) {
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [weakSelf.feedRowImageView setImage:image];
                           });
                       }
                   }];
    }
    
}
#pragma mark - Downloading Image

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if ( !error )
            {
                data = [NSData dataWithContentsOfURL:url];
                UIImage *image = [[UIImage alloc] initWithData:data];
                completionBlock(YES,image);
            } else{
                completionBlock(NO,nil);
            }
        }];
        [task resume];
});
    
    
}



@end
