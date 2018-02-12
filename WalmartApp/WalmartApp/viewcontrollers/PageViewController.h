//
//  PageViewController.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIPageViewController

@property (nonatomic,strong) NSArray *productList ;
@property(nonatomic,assign)int  currentIndex;

@end
