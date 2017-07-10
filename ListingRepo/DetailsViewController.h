//
//  DetailsViewController.h
//  ListingRepo
//
//  Created by miquido on 10/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repomodel.h"
#import "ViewController.h"
#import "RepoTableViewCell.h"

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Repomodel *repomodel;
@property (weak, nonatomic) IBOutlet UILabel *DetailLabel;

@end
