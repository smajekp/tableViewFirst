//
//  DetailsViewController.m
//  ListingRepo
//
//  Created by miquido on 10/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import "DetailsViewController.h"
#import "Repomodel.h"
#import "AFNetworking.h"
#import "ViewController.h"
#import "RepoTableViewCell.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.DetailLabel.text = self.repomodel.repoName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
