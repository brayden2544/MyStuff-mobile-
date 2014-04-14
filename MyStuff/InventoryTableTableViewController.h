//
//  InventoryTableTableViewController.h
//  MyStuff
//
//  Created by Brayden Adams on 4/9/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InventoryTableTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>{
    
}
@property (nonatomic, strong) NSMutableArray *inventoryImages;
@property (nonatomic, strong) NSMutableArray *inventoryNames;
@property (nonatomic, strong) NSMutableArray *inventoryDescriptions;
@property (nonatomic, strong) NSMutableArray *inventoryPrices;
@property (strong, nonatomic) IBOutlet UIView *header;


@end
