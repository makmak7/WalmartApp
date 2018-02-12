//
//  UIImageView+MAKNetworking.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MAKNetworking)

// Category on UIImageView to download and set the image via Asynchronous call
-(void) setImageFromURLPath :(NSString*) path;

@end
