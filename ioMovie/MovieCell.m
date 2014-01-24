//
//  MovieCell.m
//  ioMovie
//
//  Created by MineMac on 14/1/24.
//  Copyright (c) 2014年 theMac. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell
@synthesize imgPost = _imgPost;
@synthesize lbTitle = _lbTitle;
@synthesize lbYear = _lbYear;
@synthesize lbRating = _lbRating;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
