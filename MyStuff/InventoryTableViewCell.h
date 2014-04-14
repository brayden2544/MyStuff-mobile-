//
//  InventoryTableViewCell.h
//  MyStuff
//
//  Created by Brayden Adams on 4/9/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InventoryTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *inventoryName;
@property (strong, nonatomic) IBOutlet UILabel *inventoryDescription;
@property (strong, nonatomic) IBOutlet UILabel *inventoryPrice;
@property (strong, nonatomic) IBOutlet UIImageView *inventoryImage;

@end
