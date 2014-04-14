//
//  ViewController.m
//  MyStuff
//
//  Created by Brayden Adams on 4/7/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)viewWebsite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.byuisys.com"]];
}

@end
