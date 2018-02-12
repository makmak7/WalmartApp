//
//  Interactor.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "Interactor.h"
#import "ProductService.h"
#import "Product.h"
#import "ProductViewModel.h"

@implementation Interactor

// Each method in a Interactor Corresponds to a Use Case
-(void)getProductsStartingFrom :(int) startNumber  paginationSize:(int) size completionResult :(void(^)(NSArray * result,NSString * errorMessage)) completionResult{

    ProductService *service = [[ProductService alloc] init];
  
    [service getAllProductsFromPageNumber:startNumber tillPageSize:size completion:^(NSArray *productArray, NSString *error) {
        
        NSMutableArray *productViewModelArray = [[NSMutableArray alloc]init];
        for (Product *eachProduct in productArray){
            
            ProductViewModel *viewModel = [[ProductViewModel alloc]initWithProduct:eachProduct];
            [productViewModelArray addObject:viewModel];
            
        }
            
        completionResult([productViewModelArray copy],error);
    }];
}

@end
