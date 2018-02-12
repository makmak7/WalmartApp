//
//  Product.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic,strong) NSString * productId;
@property (nonatomic,strong) NSString * productName;
@property (nonatomic,strong) NSString * shortDescription;
@property (nonatomic,strong) NSString * longDescription;
@property (nonatomic,strong) NSString * price;
@property (nonatomic,strong) NSString * productImage;

@property (nonatomic,assign) float reviewRating;
@property (nonatomic,assign) float reviewCount;
@property (nonatomic,assign) BOOL inStock;

-(instancetype)init;
// Designated Initializer
-(instancetype)initWithProductID :(NSString*)productID productName :(NSString*) name productDescription :(NSString*) description longDescription :(NSString*) longDescription productPrice:(NSString*) price productImage :(NSString*) imageURL reviewRating:(float) rating reviewCount:(float) count inStock:(BOOL) inStock;


@end
