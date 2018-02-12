//
//  Interactor.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interactor : NSObject

// Each method in a Interactor Corresponds to a Use Case
- (void) getProductsStartingFrom :(int) startNumber  paginationSize:(int) size completionResult :(void(^)(NSArray * result,NSString * errorMessage)) completionResult;

@end
