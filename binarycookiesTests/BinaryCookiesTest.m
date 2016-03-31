//
//  BinaryCookiesTest.m
//  binarycookies
//
//  Created by Чайка on 3/31/16.
//  Copyright © 2016 Instrumentality of Mankind. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BinaryCookies.h"

NSString * const CookiePath = @"~/Library/Cookies/Cookies.binarycookies";

@interface BinaryCookiesTest : XCTestCase

@end

@implementation BinaryCookiesTest

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
	NSString *cookiePath = [CookiePath stringByExpandingTildeInPath];
	@try {
		NSArray *array = [BinaryCookies parseWithPath:cookiePath];
		NSLog(@"%@", array);
	} @catch (NSException *exception) {
		NSLog(@"%@", exception);
		XCTFail(@"Catch exception : %@", exception);
	}
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
