//
//  PageViewController.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "PageViewController.h"
#import "ProductDetailsViewController.h"

@interface PageViewController () <UIPageViewControllerDataSource>

@end

@implementation PageViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ProductDetailsViewController * productDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailsViewController"];
    
    productDetailsVC.viewModel = self.productList[self.currentIndex];
    productDetailsVC.currentIndex = self.currentIndex;
    NSLog(@"INitail Current Index = %d", self.currentIndex);
    
    [self setViewControllers:@[productDetailsVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Page View DataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    ProductDetailsViewController *oldProductDetailsVC = (ProductDetailsViewController *)viewController;
    int newIndex =oldProductDetailsVC.currentIndex + 1;
    if (newIndex > self.productList.count - 1) {
        return nil;
    }
    
    ProductDetailsViewController *newProductDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailsViewController"];
    newProductDetailsVC.viewModel = self.productList[newIndex];
    newProductDetailsVC.currentIndex = newIndex;
    return newProductDetailsVC;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    ProductDetailsViewController *oldProductDetailsVC = (ProductDetailsViewController *)viewController;
    int  newIndex = oldProductDetailsVC.currentIndex - 1;
    NSLog(@"Backward newIndex %d",newIndex);
    if (newIndex < 0) {
        return nil;
    }
    
    ProductDetailsViewController *newProductDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailsViewController"];
    
    
    newProductDetailsVC.viewModel = self.productList[newIndex];
    newProductDetailsVC.currentIndex = newIndex;
    
    
    return newProductDetailsVC;
    
}




@end
