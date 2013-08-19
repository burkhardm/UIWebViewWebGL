//
//  Showcase.m
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import "Showcase.h"

@implementation Showcase

@synthesize name, url, author, imageUrl;

-(id)initWithNameAndAddrAndAuthor: (NSString *)inName url:(NSString *)inAddress author:(NSString*)inAuthor img:(NSString *)inImageUrl
{
    if (self = [super init])
    {
        [self setName:inName];
        [self setUrl:[NSURL URLWithString:inAddress]];
        [self setAuthor:inAuthor];
        if(inImageUrl && ![inImageUrl isEqualToString:@""])
            [self setImageUrl:[NSURL URLWithString:inImageUrl]];
    }
    return self;
}

-(id)initWithNameAndAddr: (NSString *)inName url:(NSString *)inAddress 
{
    return [self initWithNameAndAddrAndAuthor:inName url:inAddress author:nil img:nil];
}

-(id)init
{
    if (self = [super init])
    {
        name = @"Not initialized";
        url = nil;
        author = @"";
        imageUrl = nil;
    }
    return self;
}

-(NSString *) description {
    return name;
}

@end
