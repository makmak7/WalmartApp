//
//  ProductViewModel.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "ProductViewModel.h"
#import "Product.h"

@implementation ProductViewModel

#pragma mark - Life Cycle Methods

- (instancetype) initWithProduct:(Product*) product{
    self = [super init];
    if(self){
        _productId = product.productId;
        _productName = product.productName;
        _shortDescription = product.shortDescription;
        _longDescription = product.longDescription;
        _price = product.price;
        _productImage= product.productImage;
        _reviewRating= product.reviewRating;
        _reviewCount= product.reviewCount;
        _inStock = product.inStock;
    }
    
    return self;
}
- (instancetype) init{
    Product *product = [[Product alloc]init];
    return [self initWithProduct:product];
}

@end
