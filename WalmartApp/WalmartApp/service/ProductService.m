//
//  ProductService.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "ProductService.h"
#import "APIClient.h"
#import "Product.h"

static const NSString* kAPIKey = @"9a9ba8a6-ba9a-4083-9582-9ea5f8c4a0f8";

@interface ProductService()

@end

@implementation ProductService{
    // Private Instance Variable
    NSString *stringURL ;
}

#pragma mark - Life Cycle Methods

-(instancetype) init{
    
    self = [super init];
    if(self){
        stringURL =@"https://walmartlabs-test.appspot.com/_ah/api/walmart/v1/";
    }
    return self;
}


#pragma mark - Product Service Calls
-(void) getAllProductsFromPageNumber:(int) pageNumber tillPageSize :(int)pageSize completion :(void(^)(NSArray * result,NSString * errorMessage)) completion{
    
    
    NSString *pathURL = [stringURL stringByAppendingFormat:@"walmartproducts/%@/%d/%d",kAPIKey,pageNumber,pageSize];
    
    NSURL *url = [NSURL URLWithString:pathURL];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [APIClient sharedAPIClient].session;
    
    NSURLSessionDataTask *dataTask =
    [session dataTaskWithRequest:req
                    completionHandler:
     ^(NSData *data, NSURLResponse *response, NSError *error) {
         
         NSString *message;
         NSArray *productArray;
         if(error != nil){
             message = [error localizedDescription];
             
         }else{
             
             NSError *error2 = nil;
             NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:&error2];
             productArray =  [self p_parseJSON :jsonDict];
             message = [error2 localizedDescription];
         }
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 completion(productArray,message);
             });
         
     }];
    [dataTask resume];
 
}

#pragma mark - Private Methods

- (NSArray*)p_parseJSON :(NSDictionary*) jsonDict{
    
    NSArray *jsonArray = [jsonDict objectForKey:@"products"];
    
    NSMutableArray *productArray = [[NSMutableArray alloc]init];
    
    for (int i =0 ;i < [jsonArray count]; i++){
        NSDictionary *eachRow = jsonArray[i];
        NSString *productId = eachRow[@"productId"];
        NSString *productName = eachRow[@"productName"];
        NSString *shortDescription = eachRow[@"shortDescription"];
        NSString *longDescription = eachRow[@"longDescription"];
        NSString *price = eachRow[@"price"];
        NSString *productImage = eachRow[@"productImage"];
        
        NSString *reviewString = eachRow[@"reviewRating"];
        float reviewRating =  [reviewString floatValue];
        
        NSString *reviewCountString = eachRow[@"reviewCount"];
        float reviewCount = [reviewCountString floatValue];
        
        NSString *inStockString = eachRow[@"inStock"];
        BOOL inStock = [inStockString boolValue];
        
        Product *product = [[Product alloc] initWithProductID:productId productName:productName productDescription:shortDescription longDescription:longDescription productPrice:price productImage:productImage reviewRating:reviewRating reviewCount:reviewCount inStock:inStock];
        
         [productArray addObject:product];
    }
    
    return [productArray copy];
    
}

@end
