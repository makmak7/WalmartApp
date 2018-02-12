//
//  ProductService.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductService : NSObject


-(void) getAllProductsFromPageNumber:(int) pageNumber tillPageSize :(int)pageSize completion :(void(^)(NSArray * result,NSString * errorMessage)) completion;

@end
