//
//  PlacesViewController.m
//  FlickrApp
//
//  Created by Tawheed Abdul-Raheem on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlacesViewController.h"
#import "FlickrFetcher.h"
#import "PlacesPictureViewController.h"


@interface PlacesViewController ()

@end

@implementation PlacesViewController



-(void)setTopPlaces:(NSArray *)topPlaces{
    if (_topPlaces != topPlaces) {
        _topPlaces = topPlaces;
        //our model might have changed so we want to update our view
        if (self.tableView.window);
        [self.tableView reloadData];
    }
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//This gets called when the view initially loads
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topPlaces = [FlickrFetcher topPlaces];
    
}

//This gets called when view unloads
- (void)viewDidUnload
{
    [super viewDidUnload];
}

 


//Total number of rows in the table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.topPlaces count];
}



//This displays the table cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Flickr Photo Places";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    NSDictionary *photo = [self.topPlaces objectAtIndex:indexPath.row]; //get data at given row

//    NSString *photoTitle = [photo objectForKey:FLICKR_PLACE_NAME];
//    NSString *photoDescription = [photo valueForKeyPath:@"description._content"];
//    NSLog(@"%@ %@",photoTitle, photoDescription);
    

    NSArray *content = [self splitContentwithString:[photo objectForKey:FLICKR_PLACE_NAME]];  //just the contetnt and split to an nssarray by a string
    
    cell.textLabel.text = [content objectAtIndex:0];  //displaying the first object of the nsarray

    
    __block NSString *detail = [[NSString alloc] init];
    
    [content enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != 0) {
            detail = [detail stringByAppendingString:[NSString stringWithFormat:@" %@",obj]];
        }
    }];
    
    cell.detailTextLabel.text = detail;
    
    return cell;
}

//This is the prepare for segue method
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Show Places"]) {
      
        //Get a dictionary of the row that is selected
        NSDictionary *placeDictionary = [self.topPlaces objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        
        //Once we know the row we can segue and display the list of that row
        [[segue destinationViewController]setPhotoList:[FlickrFetcher photosInPlace:placeDictionary maxResults:50] withTitle:[[sender textLabel]text]];
        
        //NSLog(@"%@",[FlickrFetcher photosInPlace:placeDictionary maxResults:1]);
        
        
        
    }
}

#pragma mark - splitContentwithString

- (NSArray *)splitContentwithString:(NSString *)string
{
    return [string componentsSeparatedByString:@", "];
}

@end
