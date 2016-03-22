//
//  binaryCookieReader.m
//  binarycookies
//
//  Created by Чайка on 3/22/16.
//  Copyright © 2016 Instrumentality of Mankind. All rights reserved.
//

#import "binaryCookieReader.h"

NSUInteger static SingleByteLength =									4;
NSUInteger static DoubleByteLength =									8;

@interface binaryCookieReader ()
- (nonnull NSData *) readSlice:(NSInteger)length;
- (SInt64) readDoubleBigEndian:(NSUInteger)offset;
- (UInt32) readIntBigEndian;
- (UInt32) readIntBigEndian:(NSUInteger)offset;
- (SInt64) readDoubleLittleEndian;
- (SInt64) readDoubleLittleEndian:(NSUInteger)offset;
- (UInt32) readIntLittleEndian;
- (UInt32) readIntLittleEndian:(NSUInteger)offset;

- (nonnull NSData *) slice:(NSUInteger)location length:(NSUInteger)length;
@end

@implementation binaryCookieReader
#pragma mark - synthesize properties
#pragma mark - class method
#pragma mark - constructor / destructor
- (nonnull id) initWithData:(nonnull NSData *)data
{
	self = [super init];
	if (self) {
		binarycookie = [[NSData alloc] initWithData:data];
		position = 0;
	}// end if self

	return self;
}// end - (nonnull id) init
#pragma mark - override
#pragma mark - properties
#pragma mark - actions
#pragma mark - messages
#pragma mark - private
- (nonnull NSData *) readSlice:(NSInteger)length
{
	NSRange rangeSlice = NSMakeRange(position, length);
	NSData *slice = [binarycookie subdataWithRange:rangeSlice];
	position += length;

	return slice;
}// end - (nonnull NSData *) readSlice:(NSInteger)length

- (SInt64) readDoubleBigEndian
{
	SInt64 data = [self readDoubleBigEndian:position];
	position += DoubleByteLength;

	return data;
}// end - (SInt64) readDoubleBigEndian

- (SInt64) readDoubleBigEndian:(NSUInteger)offset
{
	NSData *sliced = [self slice:offset length:DoubleByteLength];
	double_t buffer = 0;
	memcpy(&buffer, sliced.bytes, sizeof(double_t));

	return (SInt64)NSSwapHostDoubleToBig((double)buffer).v;
}// end - (SInt64) readDoubleBigEndian:(NSUInteger)offset

- (UInt32) readIntBigEndian
{
	UInt32 data = [self readIntBigEndian:position];
	position += SingleByteLength;

	return data;
}// end - (UInt32) readIntBigEndian

- (UInt32) readIntBigEndian:(NSUInteger)offset
{
	NSData *sliced = [self slice:offset length:SingleByteLength];
	UInt32 buffer = 0;
	[sliced getBytes:&buffer length:SingleByteLength];

	return NSSwapInt(buffer);
}// end - (UInt32) readIntBigEndian:(NSUInteger)offset

- (SInt64) readDoubleLittleEndian
{
	SInt64 data = [self readDoubleLittleEndian:position];
	position += DoubleByteLength;

	return data;
}// end - (SInt64) readDoubleLittleEndian

- (SInt64) readDoubleLittleEndian:(NSUInteger)offset
{
	NSData *sliced = [self slice:offset length:DoubleByteLength];
	double_t buffer = 0;
	memcpy(&buffer, sliced.bytes, sizeof(double_t));

	return (SInt64)buffer;
}// end - (SInt64) readDoubleLittleEndian:(NSUInteger)offset

- (UInt32) readIntLittleEndian
{
	UInt32 data = [self readIntBigEndian:position];
	position += SingleByteLength;

	return data;
}// end - (uint32) readIntLittleEndian

- (UInt32) readIntLittleEndian:(NSUInteger)offset
{
	NSData *sliced = [self slice:position length:SingleByteLength];
	UInt32 buffer = 0;
	[sliced getBytes:&buffer length:sizeof(UInt32)];

	return buffer;
}// end - (UInt32) readIntLittleEndian:(NSUInteger)offset

- (nonnull NSData *) slice:(NSUInteger)location length:(NSUInteger)length
{
	NSRange	rangeSlice = NSMakeRange(location, length);

	return [binarycookie subdataWithRange:rangeSlice];
}// end - (nonnull NSData *) slice:(NSUInteger)location length:(NSUInteger)length
#pragma mark - delegate
#pragma mark - C functions

@end
