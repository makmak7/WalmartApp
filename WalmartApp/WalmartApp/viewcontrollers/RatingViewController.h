//
//  RatingViewController.h
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingViewController : UIViewController

// Designated Initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

// Convenience Initializer
-(instancetype) initWithRating:(float) rating reviewCount:(int) count;


@end
