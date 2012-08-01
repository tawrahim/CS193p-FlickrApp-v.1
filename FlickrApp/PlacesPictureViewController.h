//
//  PlacesPictureViewController.h
//  FlickrApp
//
//  Created by Tawheed Abdul-Raheem on 7/26/12.
//
//

#import <UIKit/UIKit.h>

@interface PlacesPictureViewController : UITableViewController
@property (nonatomic,weak)NSArray *photos;
- (void)setPhotoList:(NSArray *)photoList withTitle:(NSString *)title;
@end
