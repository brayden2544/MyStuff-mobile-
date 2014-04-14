//
//  InventoryTableViewCell.m
//  MyStuff
//
//  Created by Brayden Adams on 4/9/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import "InventoryTableViewCell.h"
#import "InventoryTableTableViewController.h"

@implementation InventoryTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)inventoryCell
{
    self = [super initWithStyle:style reuseIdentifier:inventoryCell];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
