//
//  UITableViewCell+MAKNetworking.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (MAKNetworking)

// Category on TableViewCell to download and set the image via Asynchronous call
-(void) setImageFromURL :(NSString*) imagePath;

@end
