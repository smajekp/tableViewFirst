//
//  ViewController.m
//  ListingRepo
//
//  Created by miquido on 07/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "RepoTableViewCell.h"
#import "Repomodel.h"
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *tableData;
NSMutableArray *itemsArray;


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    [self registerCellForTableView];
    [self getItemsList];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqual: @"detailsSegue"]){
        if([segue.destinationViewController isKindOfClass:[DetailsViewController class]]){
            DetailsViewController *detailsController = (DetailsViewController *)segue.destinationViewController;

            if([sender isKindOfClass:[Repomodel class]]){
                detailsController.repomodel = sender;
            }
            
        }
    }
}

-(void)registerCellForTableView{
    UINib *nib = [UINib nibWithNibName:@"RepoTableViewCell" bundle:nil];
    [self.tableView registerNib :nib forCellReuseIdentifier:@"RepoTableViewCell"];
}

-(void)getItemsList
{
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [activityIndicator startAnimating];
    
    [manager GET:@"https://api.github.com/search/repositories?q=language:swift&per_page=10" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        activityIndicator.hidden = YES;
         
         //we will add Modal class objects of users in this array
         
         itemsArray=[[NSMutableArray alloc]init];
         
         //getting result dictionary from response
         NSDictionary *resultDictinary = [responseObject objectForKey:@"items"];
         for (NSDictionary *itemDictionary in resultDictinary)
         {
             //allocating new user from the dictionary
             Repomodel *newItem=[[Repomodel alloc]initWithDictionary:itemDictionary];
             [itemsArray addObject:newItem];
         }
    
         
         //reload your tableview data
         [self.tableView reloadData];
         
         
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [itemsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Repomodel *model = itemsArray[indexPath.row];
    
    RepoTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"RepoTableViewCell"];
    
    [cell configureCellWithRepo:model];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   Repomodel *model = itemsArray[indexPath.row];

    [self performSegueWithIdentifier:@"detailsSegue" sender:model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
