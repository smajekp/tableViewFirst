//
//  RepoTableViewCell.m
//  ListingRepo
//
//  Created by miquido on 07/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import "RepoTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation RepoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithRepo:(Repomodel*)repo {
    self.repoNameLabel.text = repo.repoName;
    
    NSURL *url = [NSURL URLWithString:repo.repoImage];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.repoNameImage.image = [UIImage imageWithData:data];

}


@end
