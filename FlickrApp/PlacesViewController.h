//
//  PlacesViewController.h
//  FlickrApp
//
//  Created by Tawheed Abdul-Raheem on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesViewController : UITableViewController
@property (nonatomic,strong)NSArray *topPlaces;
- (NSArray *)splitContentwithString:(NSString *)string;
@end
