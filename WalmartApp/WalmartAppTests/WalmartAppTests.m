//
//  WalmartAppTests.m
//  WalmartAppTests
//
//  Created by makeshwaran sampath on 2/10/18.
//  Copyright © 2018 mak. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Product.h"
#import "ProductViewModel.h"
#import "ProductService.h"
#import "Interactor.h"
#import "UITableViewCell+MAKNetworking.h"
#import "UIImageView+MAKNetworking.h"


@interface WalmartAppTests : XCTestCase

@property (nonatomic,strong) NSArray *productResult;

@end

@implementation WalmartAppTests{
    
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void) testProductViewModel{
    
    Product *product = [[Product alloc] initWithProductID:@"123" productName:@"VIZIO TV" productDescription:@"Resolution: 1080p" longDescription:@"Instantly enjoy the latest hit movies, TV shows, music and even more premium apps" productPrice:@"$878.00" productImage:@"http://someurl/0084522601078_A" reviewRating:4.2 reviewCount:89 inStock:YES];
    
    ProductViewModel *viewModel = [[ProductViewModel alloc ]initWithProduct:product];
    NSString *productID = viewModel.productId;
    XCTAssert([productID isEqualToString:@"123"], @"Product ID mismatch");
    
    NSString *productName = viewModel.productName;
    XCTAssert([productName isEqualToString:@"VIZIO TV"], @"Product Name mismatch");
    
    NSString *productDescription = viewModel.shortDescription;
    XCTAssert([productDescription isEqualToString:@"Resolution: 1080p"], @"Product Description mismatch");
    
    NSString *productLongDescription = viewModel.longDescription;
    XCTAssert([productLongDescription isEqualToString:@"Instantly enjoy the latest hit movies, TV shows, music and even more premium apps"], @"Product Long Description mismatch");
    
    NSString *productPrice = viewModel.price;
    XCTAssert([productPrice isEqualToString:@"$878.00"], @"Product Price mismatch");
    
    NSString *productImage = viewModel.productImage;
    XCTAssert([productImage isEqualToString:@"http://someurl/0084522601078_A"], @"Product Image URL  mismatch");
    
    float productRating = viewModel.reviewRating;
    XCTAssertEqualWithAccuracy(productRating, 4.2, .1);
    
    float productReviewCount = viewModel.reviewCount;
    XCTAssert(productReviewCount == 89, @"Product Review Count  mismatch");
    
    BOOL productInStock = viewModel.inStock;
    XCTAssert(productInStock == YES, @"Product Instock  mismatch");
    
}

-(void) testProductService{
    
    ProductService *service = [[ProductService alloc]init];
    
    [service getAllProductsFromPageNumber:1 tillPageSize:5 completion:^(NSArray *result, NSString *errorMessage) {
        XCTAssertNil(errorMessage,@"There is error calling the service");
        XCTAssertNotNil(result, @"No Products received from the server");
    }];
    
}

-(void) testInteractor{
    Interactor *interactor = [[Interactor alloc]init];
    
    [interactor getProductsStartingFrom:1 paginationSize:5 completionResult:^(NSArray *result, NSString *errorMessage) {
        XCTAssertNil(errorMessage,@"There is error calling the Interactor");
        XCTAssertNotNil(result, @"No Products received from the Interactor");
    }];
    
}
-(void) testUITableViewCellCategory{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    [cell setImageFromURL:@"https://walmartlabs-test.appspot.com/images/image6.jpeg"];
    XCTAssertNil(cell.imageView.image,@"Image not set in Table view cell");
    
}
-(void) testUIImageView{
    UIImageView *imageView = [[UIImageView alloc]init];
    
    [imageView setImageFromURLPath:@"https://walmartlabs-test.appspot.com/images/image6.jpeg"
     ];
    
    XCTAssertNil(imageView.image,@"Image not set in ImageView");
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
