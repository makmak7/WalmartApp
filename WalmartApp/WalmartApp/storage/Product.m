//
//  Product.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "Product.h"

@interface Product()



@end

@implementation Product

- (instancetype)init{
    return [self initWithProductID:@"" productName:@"" productDescription:@"" longDescription:@"" productPrice:@"" productImage:@"" reviewRating:0 reviewCount:0 inStock:NO];
}

- (instancetype)initWithProductID :(NSString*)productID productName :(NSString*) name productDescription :(NSString*) description longDescription :(NSString*) longDescription productPrice:(NSString*) price productImage :(NSString*) imageURL reviewRating:(float) rating reviewCount:(float) count inStock:(BOOL) inStock{
    
    self = [super init];
    if(self){
        _productId = productID;
        _productName = name;
        _shortDescription = description;
        _longDescription = longDescription;
        _price =price;
        _productImage = imageURL;
        _reviewRating = rating;
        _reviewCount = count;
        _inStock = inStock;
        
    }
    

    
    return self;
}

-(NSString*) description{
    return [NSString stringWithFormat:@"%@ %@",_productId,_productName ];
}

@end
