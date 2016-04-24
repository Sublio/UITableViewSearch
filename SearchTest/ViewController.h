//
//  ViewController.h
//  SearchTest
//
//  Created by sublio on 24/04/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UISearchBarDelegate>

@property (weak, nonatomic)IBOutlet UISearchBar* searchBar;

@end

