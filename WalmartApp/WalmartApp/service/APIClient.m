//
//  APIClient.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient

#pragma mark - Life Cycle Methods

// Singleton Class
+(APIClient*)sharedAPIClient{
    
    static APIClient *sharedClient;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[APIClient alloc]initPrivate];
    });
    return sharedClient;
}

- (instancetype)initPrivate{
    self = [super init];
    if(self){
        
        NSURLSessionConfiguration *sessionConfiguration =  [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
        
    }
    
    return self;
    
}
- (instancetype)init{
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [APIClient .sharedAPIClient]" userInfo:nil];
}

@end
