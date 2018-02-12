//
//  RatingViewController.m
//  WalmartApp
//
//  Created by makeshwaran sampath on 2/11/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import "RatingViewController.h"

@interface RatingViewController ()



@property (nonatomic,assign) float rating;
@property (nonatomic,assign) int reviewCount;

@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3 ;
@property (weak, nonatomic) IBOutlet UIImageView *star4 ;
@property (weak, nonatomic) IBOutlet UIImageView *star5;
@property (weak, nonatomic) IBOutlet UILabel *reviewCountLabel;

@end

@implementation RatingViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_renderStarRating];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Designated Initializer
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}
// Convenience Initializer
- (instancetype)initWithRating:(float) rating reviewCount:(int) count{
 
    self = [self initWithNibName:@"RatingViewController" bundle:nil];
    if(self){
        _rating = rating;
        _reviewCount = count;
    }
    return self;
}

#pragma mark - Private Methods

- (void)p_renderStarRating{
    
    self.reviewCountLabel.text = [NSString stringWithFormat:@"%d",self.reviewCount];
    NSArray *array = @[_star1,_star2,_star3,_star4,_star5];
    for(int i = 0; i < 5; ++i) {
        
        UIImageView *imageView = (UIImageView*)[array objectAtIndex:i];
 
        if (self.rating >= i+1) {
            imageView.image = [UIImage imageNamed:@"full"];
        } else if (self.rating > i) {
            imageView.image = [UIImage imageNamed:@"halffull"];
        } else {
            imageView.image = [UIImage imageNamed:@"empty"];
        }
    }
    
}

@end
