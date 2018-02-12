//
//  ProductViewModel.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product;
@interface ProductViewModel : NSObject

@property (nonatomic,strong) NSString * productId;
@property (nonatomic,strong) NSString * productName;
@property (nonatomic,strong) NSString * shortDescription;
@property (nonatomic,strong) NSString * longDescription;
@property (nonatomic,strong) NSString * price;
@property (nonatomic,strong) NSString * productImage;

@property (nonatomic,assign) float reviewRating;
@property (nonatomic,assign) float reviewCount;
@property (nonatomic,assign) BOOL inStock;

// Designated Initializer
- (instancetype) initWithProduct:(Product*) product;
- (instancetype) init;

@end
