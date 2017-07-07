//
//  ViewController.h
//  ListingRepo
//
//  Created by miquido on 07/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *activityIndicator;

@end

