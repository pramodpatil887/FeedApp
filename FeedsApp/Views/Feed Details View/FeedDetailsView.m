//
//  FeedDetailsView.m
//  FeedsApp
//
//  Created by Pramod Ganapati Patil on 21/01/18.
//  Copyright © 2018 feeds. All rights reserved.
//

#import "FeedDetailsView.h"
#import "FeedRow.h"
#import "FeedRowCell.h"
#import "FeedDetailsPresenter.h"

@interface FeedDetailsView ()
{
    UIActivityIndicatorView *spinner;
    Feed *feed;
}
@end

@implementation FeedDetailsView
static NSString *FeedCellIdentifier = @"FeedCellIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setUpView];
    [self.feedDetailsPresenter viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Setting view
-(void)setUpView
{
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 50;
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tableView registerClass:[FeedRowCell class] forCellReuseIdentifier:FeedCellIdentifier];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feed.rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedRowCell *cell = [tableView dequeueReusableCellWithIdentifier:FeedCellIdentifier forIndexPath:indexPath];
    
    [cell setDetails:[feed.rows objectAtIndex:indexPath.row]];
    
    return cell;
}
#pragma mark - Tablew View delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedRow *feedRow = feed.rows[indexPath.row];
    NSString *cellText = feedRow.descriptionDetails;
    UIFont *cellFont = [UIFont systemFontOfSize:14];
    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    CGRect labelSize = [cellText boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:cellFont} context:nil];
    CGFloat height = labelSize.size.height + 35;
    if (height < 60) {
        return 60;
    }
    return height;
}
#pragma mark - Adding Spinner
-(void)addSpinner
{
    if(!spinner){
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        spinner.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        spinner.center =  self.view.center;
        [self.view addSubview: spinner];
        [spinner setHidesWhenStopped:YES];
    }
}

#pragma mark - Show Loading
-(void)showLoading
{
    [self addSpinner];
    [spinner startAnimating];
    [spinner setHidden:NO];
}
#pragma mark - Hiding Spinner
-(void)hideLoading
{
    [spinner setHidden:YES];
    [spinner stopAnimating];
}
#pragma mark - Show Feed Details
-(void)showFeedDetails:(Feed *)feedDetails
{
    feed = feedDetails;
    self.title = feed.title;
    
    [self.tableView reloadData];
}

@end
