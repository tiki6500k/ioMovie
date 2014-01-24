//
//  MovieCell.h
//  ioMovie
//
//  Created by MineMac on 14/1/24.
//  Copyright (c) 2014年 theMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell


@property(nonatomic, retain) IBOutlet UIImageView *imgPost;
@property(nonatomic, retain) IBOutlet UILabel *lbTitle;
@property(nonatomic, retain) IBOutlet UILabel *lbYear;
@property(nonatomic, retain) IBOutlet UILabel *lbRating;
@end
