//
//  RepairViewController.h
//  MyStuff
//
//  Created by Brayden Adams on 4/9/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepairViewController : UIViewController

- (IBAction)pressedRepairRequest:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *repairStatus;
@property (weak, nonatomic) IBOutlet UILabel *damageReport;
@property (weak, nonatomic) IBOutlet UITextField *repairNumber;

@end
