//
//  ProductListTableViewController.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "ProductListTableViewController.h"
#import "Interactor.h"
#import "ProductViewModel.h"
#import "PageViewController.h"
#import "UITableViewCell+MAKNetworking.h"


@interface ProductListTableViewController ()

@property (nonatomic,strong) NSMutableArray *productList ;

@end

@implementation ProductListTableViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _productList = [[NSMutableArray alloc]init];
    self.navigationItem.title = @"Product List";
    [self p_reloadData];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.productList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    
    ProductViewModel *viewModel = self.productList[indexPath.row];
    cell.textLabel.text = viewModel.productName;
    cell.detailTextLabel.text = viewModel.price;
    NSString *imageURL = viewModel.productImage;
    [cell setImageFromURL:imageURL];
    
    BOOL lastItemReached = [viewModel isEqual:[self.productList lastObject]];
    if(lastItemReached && indexPath.row == [self.productList count] - 1 ){
        [self p_reloadData];
    }
    
    return cell;
}

#pragma mark - PrivateMethods

- (void)p_reloadData{
    int count = (int)[_productList count];
    int startIndex = count +1;
    int endIndex = count +25;
    NSLog(@"Start Index = %d and End Index = %d",startIndex,endIndex);
    [self p_loadDataFromStartIndex:startIndex tillPageSize:endIndex];
}

- (void)p_loadDataFromStartIndex:(int) startIndex tillPageSize :(int) size{
    
    Interactor *interactor = [[Interactor alloc]init];
    
    UIActivityIndicatorView * activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(0, 0, 80, 80);
    [activityIndicator startAnimating];
    self.tableView.tableFooterView = activityIndicator;
    
    [interactor getProductsStartingFrom:startIndex paginationSize:size completionResult:^(NSArray *result, NSString *errorMessage) {
        
        if(errorMessage!= nil){
            [self p_displayErrorMessage:errorMessage];
        }else{
            if([result count] == 0){
                // no more rows
            }else{
                [_productList addObjectsFromArray:result];
                [self.tableView reloadData];
            }
            
        }
        [activityIndicator removeFromSuperview];
    }];
}
- (void)p_displayErrorMessage :(NSString*) errorMessage{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Message"
                                                                    message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"Ok"
                                                        style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                            //Handle Any Conditions
                                                        }];
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Segue Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    PageViewController *pageViewController = (PageViewController*)[segue destinationViewController];
    pageViewController.productList = [self.productList copy];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    pageViewController.currentIndex = (int)indexPath.row;
}

- (IBAction)close :(UIStoryboardSegue *)segue{
    NSLog(@"DetailsView Controller is closed");
}

@end
