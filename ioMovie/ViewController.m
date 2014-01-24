//
//  ViewController.m
//  ioMovie
//
//  Created by MineMac on 14/1/23.
//  Copyright (c) 2014年 theMac. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"
#import "MovieCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableData = tableData;
@synthesize selfTable = selfTable;
@synthesize activityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    dataUrlImg = [NSMutableDictionary new];
    
    // indicator init
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityIndicator.center = CGPointMake(160, 240);
    [activityIndicator setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activityIndicator];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *strEncoded = [[searchBar text] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self.view endEditing:YES];
    
    [activityIndicator startAnimating];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://api.movies.io/movies/search?q=%@",strEncoded] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        tableData = [responseObject objectForKey:@"movies"];
        
        // download image and chache
        for (NSDictionary *movie in tableData)
        {
            NSString *postUrl = [[[movie objectForKey:@"poster"] objectForKey:@"urls"] objectForKey:@"original"];
            if ([dataUrlImg objectForKey:postUrl] == nil) {
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:postUrl]];
                [dataUrlImg setValue:data
                              forKey:postUrl];
            }
        }
        
        [activityIndicator stopAnimating];
        [selfTable reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [activityIndicator stopAnimating];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"searching"
                                                        message:@"not found"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        NSLog(@"Error: %@", error);
    }];
}


#pragma mark - table delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.lbTitle.text = [[tableData objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    cell.lbYear.text = [NSString stringWithFormat:@"year: %@",[[tableData objectAtIndex:indexPath.row] objectForKey:@"year"]];
    
    cell.lbRating.text = [NSString stringWithFormat:@"rating: %@",[[tableData objectAtIndex:indexPath.row] objectForKey:@"rating"]];
    
    NSString *postUrl = [[[[tableData objectAtIndex:indexPath.row] objectForKey:@"poster"] objectForKey:@"urls"] objectForKey:@"original"];
    NSData *findData = [dataUrlImg objectForKey:postUrl];
    cell.imgPost.image = [UIImage imageWithData:findData];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}
@end
