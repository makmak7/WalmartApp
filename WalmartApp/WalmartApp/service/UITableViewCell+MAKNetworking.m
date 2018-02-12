//
//  UITableViewCell+MAKNetworking.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "UITableViewCell+MAKNetworking.h"

@implementation UITableViewCell (MAKNetworking)

// Category on TableViewCell to download and set the image via Asynchronous call
-(void) setImageFromURL :(NSString*) imagePath{

// ASYNC Network call by Concurrent Queue
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

    UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:imagePath]]];
    
    // UI Update  by Main Serial Queue
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = img;
        [self setNeedsLayout];
    });
});
    
}

@end
