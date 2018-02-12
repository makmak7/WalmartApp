//
//  UIImageView+MAKNetworking.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "UIImageView+MAKNetworking.h"

@implementation UIImageView (MAKNetworking)

// Category on UIImageView to download and set the image via Asynchronous call
-(void) setImageFromURLPath :(NSString*) path{
    
    // ASYNC Network call by Concurrent Queue
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:     [NSURL URLWithString:path]]];
        
        // UI Update  by Main Serial Queue
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = img;
            [self setNeedsLayout];
        });
    });
    
}

@end
