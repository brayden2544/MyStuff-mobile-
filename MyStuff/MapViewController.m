//
//  MapViewController.m
//  MyStuff
//
//  Created by Brayden Adams on 4/10/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"

@interface MapViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, strong) MKMapView *storeLocation;
@property (nonatomic, strong) CLLocationManager *userLocationManger;
@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([CLLocationManager locationServicesEnabled]){
        self.userLocationManger = [[CLLocationManager alloc] init];
        self.userLocationManger.delegate = self;
        
        [self.userLocationManger startUpdatingLocation];
    }
    self.view.backgroundColor = [UIColor blackColor];
    
    self.storeLocation = [[MKMapView alloc]
                      initWithFrame:CGRectMake(0,128, 320,300)];
    self.storeLocation.showsUserLocation = YES;
    self.storeLocation.userTrackingMode = MKUserTrackingModeFollow;
    self.storeLocation.mapType = MKMapTypeStandard;
    
    self.storeLocation.delegate=self;
    
    self.storeLocation.autoresizingMask =
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.storeLocation];
    
    
   
    
    
    CLLocationCoordinate2D Ogden =
    CLLocationCoordinate2DMake(41.2278, -111.9611);
    
    CLLocationCoordinate2D Sandy =
    CLLocationCoordinate2DMake(40.5725, -111.8597);
    
    CLLocationCoordinate2D Provo =
    CLLocationCoordinate2DMake(40.2444, -111.6608);
    
    MyAnnotation *ogden =
    [[MyAnnotation alloc] initWithCoordinates: Ogden
                                        title:@"Ogden Store"
                                        subTitle:@"332 S. Harrison"];
    MyAnnotation *sandy =
    [[MyAnnotation alloc] initWithCoordinates: Sandy
                                        title:@"Sandy Store"
                                     subTitle:@"720 S. State Street"];

    MyAnnotation *provo =
    [[MyAnnotation alloc] initWithCoordinates: Provo
                                        title:@"Provo Store"
                                     subTitle:@"324 E. Center Street"];


    [self.storeLocation addAnnotation:ogden];
    [self.storeLocation addAnnotation:provo];
    [self.storeLocation addAnnotation:sandy];

    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)setCenterProvo:(id)sender {
    CLLocationCoordinate2D Provo =
    CLLocationCoordinate2DMake(40.2444, -111.6608);
  
    MyAnnotation *provo =
    [[MyAnnotation alloc] initWithCoordinates: Provo
                                        title:@"Provo Store"
                                     subTitle:@"324 E. Center Street"];
    [self.storeLocation addAnnotation:provo];
    [self.storeLocation selectAnnotation:provo animated:YES];
    [_storeLocation setCenterCoordinate:Provo animated:YES];
}

- (IBAction)setCenterSandy:(id)sender {
    CLLocationCoordinate2D Sandy =
    CLLocationCoordinate2DMake(40.5725, -111.8597);
    
    MyAnnotation *sandy =
    [[MyAnnotation alloc] initWithCoordinates: Sandy
                                        title:@"Sandy Store"
                                     subTitle:@"720 S. State Street"];
    
    [self.storeLocation addAnnotation:sandy];
    [_storeLocation setCenterCoordinate:Sandy animated:YES];
    [self.storeLocation selectAnnotation:sandy animated:YES];

    
}

- (IBAction)setCenterOgden:(id)sender {
    CLLocationCoordinate2D Ogden =
    CLLocationCoordinate2DMake(41.2278, -111.9611);
    MyAnnotation *ogden =
    [[MyAnnotation alloc] initWithCoordinates: Ogden
                                        title:@"Ogden Store"
                                     subTitle:@"332 S. Harrison"];
    

    [self.storeLocation addAnnotation:ogden];
    [self.storeLocation selectAnnotation:ogden animated:YES];
    [_storeLocation setCenterCoordinate:Ogden animated:YES];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
