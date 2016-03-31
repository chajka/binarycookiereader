//
//  BinaryCookies.h
//  binarycookies
//
//  Created by Чайка on 3/25/16.
//  Copyright © 2016 Instrumentality of Mankind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryCookies : NSObject
+ (nonnull NSArray<NSHTTPCookie *> *) parseWithPath:(nonnull NSString *)cookiePath;
+ (nonnull NSArray<NSHTTPCookie *> *) parseWithURL:(nonnull NSURL *)cookieURL;
+ (nonnull NSArray<NSHTTPCookie *> *) parseWithData:(nonnull NSData *)cookieData;
@end
