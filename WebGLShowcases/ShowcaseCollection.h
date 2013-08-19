//
//  ShowcaseCollection.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowcaseCollection : NSObject
    
@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * description;
@property(nonatomic, strong) NSMutableArray *showcases;

-(void)insertShowcase:(NSString*)inName url:(NSString*)inUrl author:(NSString*)inAuthor imgUrl:(NSString*)inImageUrl;
-(id)initWithNameAndDescription: (NSString *)inName descr:(NSString*)inDescr;
-(id)init;
@end
