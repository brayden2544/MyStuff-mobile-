//
//  InventoryTableTableViewController.m
//  MyStuff
//
//  Created by Brayden Adams on 4/9/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import "InventoryTableTableViewController.h"
#import "InventoryTableViewCell.h"


@interface InventoryTableTableViewController ()

@end

@implementation InventoryTableTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *name =@"nothing";
    NSString *description=@"nothing";
    NSString *price =@"nothing";
    NSString *sku =@"nothing";
    NSInteger itemNumber =1;
    NSInteger *array =0;
    _inventoryNames =[NSMutableArray arrayWithObjects: nil];
    _inventoryDescriptions = [NSMutableArray arrayWithObjects:nil];
    _inventoryPrices = [NSMutableArray arrayWithObjects:nil];
    _inventoryImages = [NSMutableArray arrayWithObjects:nil];

   
    while (array==0){
    NSString *urlAsString = [NSString stringWithFormat:@"http://byuisys.com/api/v1/catalog_item/%ld/?format=json", (long)itemNumber];
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse *response =nil;
    NSError *error =nil;
    //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    /*[NSURLConnection
     sendSynchronousRequest:urlRequest
     completionHandler:^(NSURLResponse *response,
                         NSData *data,
                         NSError *error)
     */
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
                                         returningResponse:&response
                                                     error:&error];
    
         if ([data length]>0 &&
             error == nil) {
             NSString *html = [[NSString alloc] initWithData:data
                                                    encoding:NSUTF8StringEncoding];
             NSLog(@"HTML = %@", html);
             NSError *error = nil;
             id itemObject = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:NSJSONReadingAllowFragments
                              error:&error];
             NSLog(@" %@",itemObject);
             name = itemObject[@"product_name"];
             description = itemObject[@"description"];
             price = itemObject[@"price"];
             sku = itemObject[@"sku"];
             [_inventoryNames addObject:name];
             [_inventoryDescriptions addObject:description];
             [_inventoryPrices addObject:price];
             [_inventoryImages addObject:sku];

             itemNumber +=1;
         }
         else if ([data length] == 0 &&
                  error == nil){
             NSLog(@"Nothing was downloaded");
             array +=1;
         }
         else if (error !=nil) {
             NSLog(@"Error happened = %@",error);
             array +=1;
         }

       
    }
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *cellID = @"sectionHeaderID";
    UITableViewCell *headerview = [tableView dequeueReusableCellWithIdentifier:cellID];
    return headerview.contentView;
}

-(UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"footer";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 24;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _inventoryNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"inventoryCell";
    InventoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    long row = [indexPath row];
    cell.inventoryName.text = _inventoryNames[row];
    cell.inventoryDescription.text = _inventoryDescriptions[row];
    cell.inventoryPrice.text = _inventoryPrices[row];
    NSString *urlAsString = [NSString stringWithFormat:@"http://byuisys.com/static/catalog/images/product/thumb/%@-thumb.jpg", _inventoryImages[row]];
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSData *data = [NSData dataWithContentsOfURL : url];
    UIImage *image = [UIImage imageWithData: data];
    [cell.inventoryImage setImage:image];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
