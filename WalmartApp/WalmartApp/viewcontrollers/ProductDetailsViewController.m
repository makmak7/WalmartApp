//
//  ProductDetailsViewController.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "ProductDetailsViewController.h"
#import "ProductViewModel.h"
#import "RatingViewController.h"
#import "UIImageView+MAKNetworking.h"

@interface ProductDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UIView *ratingView;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

@property (weak, nonatomic) IBOutlet UILabel *productCostLabel;
@property (weak, nonatomic) IBOutlet UILabel *productInStockLabel;

@property (weak, nonatomic) IBOutlet UITextView *productDescriptionTextView;
@property (weak, nonatomic) IBOutlet UITextView *productLongDescriptionTextView;

@end

@implementation ProductDetailsViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_loadProductDetailsView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

#pragma mark - Private Methods
- (void)p_loadProductDetailsView{
    self.navigationItem.title = @"Product Details";
    
    NSString *imageURL = self.viewModel.productImage;
    
    [self.productImageView setImageFromURLPath:imageURL];
    
    self.productNameLabel.text = self.viewModel.productName;
    self.productCostLabel.text = self.viewModel.price;
    if(self.viewModel.inStock){
        self.productInStockLabel.text = @"In Stock";
    }else{
        self.productInStockLabel.text = @"Not In Stock";
        self.productInStockLabel.textColor = [UIColor redColor];
    }
    
    [self.productDescriptionTextView setValue:self.viewModel.shortDescription forKey:@"contentToHTMLString"];
    [self.productDescriptionTextView setFont:[UIFont systemFontOfSize:18]];
    [self.productLongDescriptionTextView setValue:self.viewModel.longDescription forKey:@"contentToHTMLString"];
    
    [self.productLongDescriptionTextView setFont:[UIFont systemFontOfSize:18]];
    RatingViewController * ratingVC = [[RatingViewController alloc]initWithRating:self.viewModel.reviewRating reviewCount:(int)self.viewModel.reviewCount];
    [self.ratingView  addSubview: ratingVC.view];
}

@end
