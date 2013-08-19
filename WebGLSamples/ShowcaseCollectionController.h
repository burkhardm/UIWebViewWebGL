//
//  ShowcaseCollectionController.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowcaseCollection.h"
#import "Showcase.h"

@interface ShowcaseCollectionController : NSObject

@property(nonatomic, strong) NSMutableArray *showcaseCollections;

-(id)init;
-(ShowcaseCollection*)loadChromeExperimentsShowcases;
-(ShowcaseCollection*)loadWebGLShowcases;
-(ShowcaseCollection*)loadGLGEShowcases;
@end
