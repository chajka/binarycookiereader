//
//  BinaryCookies.m
//  binarycookies
//
//  Created by Чайка on 3/25/16.
//  Copyright © 2016 Instrumentality of Mankind. All rights reserved.
//

#import "BinaryCookies.h"
#import "CookieParser.h"

@implementation BinaryCookies
#pragma mark - synthesize properties
#pragma mark - class method
+ (nonnull NSArray<NSHTTPCookie *> *) parseWithPath:(nonnull NSString *)cookiePath
{
	NSData *data = [[NSData alloc] initWithContentsOfFile:cookiePath];
	CookieParser *parser = [[CookieParser alloc] initWithData:data];

	return [parser parseCookies];
}// end + (nonnull NSArray<NSHTTPCookie *> *) parseWithPath:(nonnull NSString *)cookiePath

+ (nonnull NSArray<NSHTTPCookie *> *) parseWithURL:(nonnull NSURL *)cookieURL
{
	NSData *data = [[NSData alloc] initWithContentsOfURL:cookieURL];
	CookieParser *parser = [[CookieParser alloc] initWithData:data];
	
	return [parser parseCookies];
}

+ (nonnull NSArray<NSHTTPCookie *> *) parseWithData:(nonnull NSData *)cookieData
{
	CookieParser *parser = [[CookieParser alloc] initWithData:cookieData];
	
	return [parser parseCookies];
}// end + (nonnull NSArray<NSHTTPCookie *> *) parseWithData:(nonnull NSData *)cookieData;
#pragma mark - constructor / destructor
#pragma mark - override
#pragma mark - properties
#pragma mark - actions
#pragma mark - messages
#pragma mark - private
#pragma mark - delegate
#pragma mark - C functions


@end
