//
//  CookieSlicer.h
//  binarycookies
//
//  Created by Чайка on 3/22/16.
//  Copyright © 2016 Instrumentality of Mankind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface binaryreader : NSObject {
	NSData							*data;
	NSUInteger						position;
}
@property (readwrite) NSUInteger	position;


- (nonnull id) initWithData:(nonnull NSData *)data;

- (nonnull NSData *) slice:(NSUInteger)location length:(NSUInteger)length;
- (nonnull NSData *) readSlice:(NSInteger)length;
- (SInt64) readDoubleBigEndian;
- (UInt32) readIntBigEndian;
- (SInt64) readDoubleLittleEndian;
- (UInt32) readIntLittleEndian;
- (UInt32) readIntLittleEndian:(NSUInteger)offset;
@end

@interface BinaryCookie : binaryreader
- (nonnull NSHTTPCookie *) parseCookie;
@end

@interface CookiePage : binaryreader
@property (readonly) NSUInteger pageSize;
- (nonnull NSArray<BinaryCookie *> *)parsePage;
@end

@interface PageSlicer : binaryreader
- (nonnull NSArray<CookiePage *> *)slicePage;
@end