//
//  RepairViewController.m
//  MyStuff
//
//  Created by Brayden Adams on 4/9/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import "RepairViewController.h"

@interface RepairViewController ()

@end

@implementation RepairViewController

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
    [_repairNumber becomeFirstResponder];
    _repairNumber.keyboardType = UIKeyboardTypeNumberPad;


    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedRepairRequest:(id)sender
{
    if([_repairNumber.text  isEqual:@""]){
        double delayInSeconds = 0.01;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds *     NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            
            _repairStatus.text = @"No Repair Found";
            [_repairStatus setNeedsDisplay];
            _damageReport.text = @"Please Enter A Valid Repair Number";
            [_damageReport setNeedsDisplay];
        });
  
    }
    else {
    NSLog(@"this thing is printing %@",_repairNumber.text);
    NSString *urlAsStringBegin = @"http://byuisys.com/api/v1/repair_item/";
    NSString *repairNumber = 0;
    repairNumber =_repairNumber.text;
    NSString *urlAsStringEnd = @"/?format=json";
    NSString *urlAsString1 = [urlAsStringBegin stringByAppendingString:repairNumber];
    NSString *urlAsString = [urlAsString1 stringByAppendingString:urlAsStringEnd];
    NSURL *url = [NSURL URLWithString:(urlAsString)];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection
     sendAsynchronousRequest:(urlRequest)
     queue:queue
     completionHandler:^(NSURLResponse *response,
                         NSData *data,
                         NSError *error) {
         if([data length] >0 &&
            error == nil) {
             NSString *html =[[NSString alloc] initWithData:data
                                                   encoding:NSUTF8StringEncoding];
             NSLog(@"HTML = %@", html);
         }
         else if ([data length] == 0 &&
                  error == nil){
             NSLog(@"Nothing was Downloaded.");
         }
         else if (error != nil){
             NSLog(@"Error Happened = %@", error);
         }
         error = nil;
         id jsonObject = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:NSJSONReadingAllowFragments
                          error:&error];
         if (jsonObject !=nil && error ==nil){
             
             NSDictionary *deserializedDictionary = jsonObject;
             NSLog(@"Deserialized JSON Dictionary = %@", deserializedDictionary);
             NSString *urlBeginning =@"http://byuisys.com";
             NSString *urlMiddle =[urlBeginning stringByAppendingString:deserializedDictionary[@"status"]];
             NSString *urlEnd =[urlMiddle stringByAppendingString: @"?format=json"];
             NSURL *url = [NSURL URLWithString:(urlEnd)];
             NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
             NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        
             [NSURLConnection
              sendAsynchronousRequest:(urlRequest)
              queue:queue
              completionHandler:^(NSURLResponse *response,
                                  NSData *data,
                                  NSError *error) {
                  if([data length] >0 &&
                     error == nil) {
                      NSString *html =[[NSString alloc] initWithData:data
                                                            encoding:NSUTF8StringEncoding];
                      NSLog(@"HTML = %@", html);
                      id jsonObject = [NSJSONSerialization
                                       JSONObjectWithData:data
                                       options:NSJSONReadingAllowFragments
                                       error:&error];
                          
                     NSDictionary *repairStatusDictionary = jsonObject;
                      double delayInSeconds = 0.01;
                      dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds *     NSEC_PER_SEC));
                      dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                          [_repairStatus setHidden:NO];
                          NSMutableString *repairText = [@"Repair is " stringByAppendingString:repairStatusDictionary[@"status"]];
                          
                          _repairStatus.text = repairText;
                          [_repairStatus setNeedsDisplay];
                         NSMutableString *damageReportText = [@"Damage Report: " stringByAppendingString:deserializedDictionary[@"damage_report"]];
                          _damageReport.text = damageReportText;
                          [_damageReport setNeedsDisplay];
                          NSLog(damageReportText);

                      });
                     
                      NSLog(deserializedDictionary[@"damage_report"]);
                  }
                  else if ([data length] == 0 &&
                           error == nil){
                      NSLog(@"Nothing was Downloaded.");
                  }
                  else if (error != nil){
                      NSLog(@"Error Happened = %@", error);
                  }
              }];
             
         }
         else if ([jsonObject isKindOfClass:[NSArray class]]){
             NSArray *deserializedArray = jsonObject;
             NSLog(@"Deserialized JSON Array = %@",deserializedArray);
         }
         else {
             NSLog(@"It is not a JSON object");
             double delayInSeconds = 0.01;
             dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds *     NSEC_PER_SEC));
             dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

                 
                 _repairStatus.text = @"No Repair Found";
                 [_repairStatus setNeedsDisplay];
                 _damageReport.text = @"Please Enter A Valid Repair Number";
                 [_damageReport setNeedsDisplay];
             });

         }
     }];
    }
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
