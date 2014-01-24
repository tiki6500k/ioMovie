//
//  ViewController.h
//  ioMovie
//
//  Created by MineMac on 14/1/23.
//  Copyright (c) 2014年 theMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSArray *tableData;
    UITableView *selfTable;
    NSMutableDictionary *dataUrlImg;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@property(nonatomic, retain) NSArray *tableData;
@property(nonatomic, retain) IBOutlet UITableView *selfTable;
@property(nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@end
