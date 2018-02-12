//
//  APIClient.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIClient : NSObject

@property (nonatomic, strong) NSURLSession *session;

// Singleton Class
+(APIClient*)sharedAPIClient;

@end
