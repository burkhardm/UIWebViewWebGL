//
//  Showcase.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Showcase : NSObject

@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * author;
@property(nonatomic, copy) NSURL * url;
@property(nonatomic, copy) NSURL * imageUrl;


// Designated initializer
-(id)initWithNameAndAddrAndAuthor: (NSString *)inName url:(NSString *)inUrl author:(NSString*)inAuthor img:(NSString*)inImageUrl;
-(id)initWithNameAndAddr: (NSString *)inName url:(NSString *)inAddress;
-(id)init;

@end
