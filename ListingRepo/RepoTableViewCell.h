//
//  RepoTableViewCell.h
//  ListingRepo
//
//  Created by miquido on 07/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repomodel.h"

@interface RepoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *repoNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *repoNameImage;
@property (weak, nonatomic) IBOutlet UIButton *repoButton;

-(void)configureCellWithRepo:(Repomodel*)repo;

@end
