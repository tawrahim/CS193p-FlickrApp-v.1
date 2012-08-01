//
//  PlacesPictureViewController.m
//  FlickrApp
//
//  Created by Tawheed Abdul-Raheem on 7/26/12.
//
//

#import "PlacesPictureViewController.h"
#import "FlickrFetcher.h"

@interface PlacesPictureViewController ()


@end

@implementation PlacesPictureViewController


- (void)setPhotoList:(NSArray *)photoList withTitle:(NSString *)title {
	self.photos = photoList;
	self.title = title;
}


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
  // NSLog(@"%@",self.photos);
   NSLog(@"%u",[self.photos count]);

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

//Total number of rows in the table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"%u",[self.photos count]);
    return [self.photos count];
    
}


//This displays the table cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Places Picture List";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSLog(@"Hello World");
    
    return cell;

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Pictures of Selected Photo"]) {
        
        //make a pointer to the controller
        
    }
}

@end
