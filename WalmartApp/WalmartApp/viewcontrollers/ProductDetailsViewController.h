//
//  ProductDetailsViewController.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductViewModel;
@interface ProductDetailsViewController : UITableViewController

@property(nonatomic,strong) ProductViewModel* viewModel;
@property(nonatomic,assign)int  currentIndex;

@end
