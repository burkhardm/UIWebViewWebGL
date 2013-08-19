//
//  ShowcaseCollection.m
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import "ShowcaseCollection.h"
#import "Showcase.h"

@implementation ShowcaseCollection

@synthesize name, description, showcases;

-(void)insertShowcase:(NSString*)inName url:(NSString*)inUrl author:(NSString*)inAuthor imgUrl:(NSString*)inImageUrl
{
    Showcase * showcase = [[Showcase alloc] initWithNameAndAddrAndAuthor:inName url:inUrl author:inAuthor img:inImageUrl];
    [showcases insertObject:showcase atIndex:showcases.count];
}

-(id)initWithNameAndDescription: (NSString *)inName descr:(NSString*)inDescr
{
    if (self = [super init])
    {
        [self setName:inName];
        [self setDescription:inDescr];
        [self setShowcases:[[NSMutableArray alloc] init]];
    }
    return self;
}

-(id)init
{
    if (self = [super init])
    {
        [self setName:@"Not initialized"];
        [self setDescription:@""];
        [self setShowcases:[[NSMutableArray alloc] init]];
    }
    return self;
}

@end
