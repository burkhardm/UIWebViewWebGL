//
//  ShowcaseCollectionController.m
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import "ShowcaseCollectionController.h"

@implementation ShowcaseCollectionController

@synthesize showcaseCollections;

-(id)init
{
    if (self = [super init])
    {
     
        // init showcase collection
        showcaseCollections = [[NSMutableArray alloc] init];
        
        // add Chrome Experiments Showcases from http://www.chromeexperiments.com
        [showcaseCollections insertObject:[self loadChromeExperimentsShowcases] atIndex:showcaseCollections.count];
        
        // add WebGL Showcases from http://code.google.com/p/WebGLShowcases/
        [showcaseCollections insertObject:[self loadWebGLShowcases] atIndex:showcaseCollections.count];
        
        // add GLGE Showcases from http://www.glge.org
        [showcaseCollections insertObject:[self loadGLGEShowcases] atIndex:showcaseCollections.count];
    }
    return self;
}

-(ShowcaseCollection*)loadChromeExperimentsShowcases {
    
    // create new showcase collection
    ShowcaseCollection *showcaseCollection = [[ShowcaseCollection alloc] initWithNameAndDescription:@"Chrome Experiments" descr:@"http://www.chromeexperiments.com"];
    
    [showcaseCollection insertShowcase:@"Circle Game" 
                                   url:@"http://sysach.com/circle-game/"
                                author:@"By Shea Barton"
                                imgUrl:@"http://www.chromeexperiments.com/detail/circle-game/img/ahZzfmNocm9tZXhwZXJpbWVudHMtaHJkchgLEg9FeHBlcmltZW50SW1hZ2UY1unTBAw/large"];
    
    [showcaseCollection insertShowcase:@"Sticky Thing" 
                                   url:@"http://www.spielzeugz.de/html5/sticky-thing/"
                                author:@"By Daniel Puhe"
                                imgUrl:@"http://www.chromeexperiments.com/detail/sticky-thing/img/ahZzfmNocm9tZXhwZXJpbWVudHMtaHJkchgLEg9FeHBlcmltZW50SW1hZ2UYja2uBAw/large"];
    
    [showcaseCollection insertShowcase:@"WebGL Globe" 
                                   url:@"http://workshop.chromeexperiments.com/globe/"
                                author:@"By Google Data Arts Team"
                                imgUrl:@"http://www.chromeexperiments.com/img/globe.jpg"];
    
    [showcaseCollection insertShowcase:@"WebGL Attractors Trip" 
                                   url:@"http://iacopoapps.appspot.com/hopalongwebgl/"
                                author:@"By Iacopo Sassarini"
                                imgUrl:@"http://www.chromeexperiments.com/detail/webgl-attractors-trip/img/ahZzfmNocm9tZXhwZXJpbWVudHMtaHJkchgLEg9FeHBlcmltZW50SW1hZ2UYm4HhBAw/large"];

    
    [showcaseCollection insertShowcase:@"The Rational Keyboard" 
                                   url:@"http://fritzo.org/keys/"
                                author:@"By Fritz Obermeyer"
                                imgUrl:@"http://www.chromeexperiments.com/detail/the-rational-keyboard/img/ahZzfmNocm9tZXhwZXJpbWVudHMtaHJkchgLEg9FeHBlcmltZW50SW1hZ2UY_Zb5BAw/large"];
    
    [showcaseCollection insertShowcase:@"WebGL Bookcase" 
                                   url:@"http://workshop.chromeexperiments.com/bookcase/"
                                author:@"By Google Data Arts Team"
                                imgUrl:@"http://www.chromeexperiments.com/detail/webgl-bookcase/img/ahZzfmNocm9tZXhwZXJpbWVudHMtaHJkchgLEg9FeHBlcmltZW50SW1hZ2UY75_PBAw/large"];
    
    [showcaseCollection insertShowcase:@"Plink" 
                                   url:@"http://labs.dinahmoe.com/plink/"
                                author:@"By Dinahmoe"
                                imgUrl:@"http://www.chromeexperiments.com/detail/plink-multiplayer-music-experience/img/ahZzfmNocm9tZXhwZXJpbWVudHMtaHJkchgLEg9FeHBlcmltZW50SW1hZ2UYjIrEBAw/large"];
    
    [showcaseCollection insertShowcase:@"Swiss Addresses in 3D" 
                                   url:@"http://29a.ch/sandbox/2011/addresscloud/"
                                author:@"By Jonas Wagner"
                                imgUrl:@"http://www.chromeexperiments.com/detail/swiss-addresses-in-3d/img/ahZzfmNocm9tZXhwZXJpbWVudHMtaHJkchgLEg9FeHBlcmltZW50SW1hZ2UYy7PLBAw/large"];
    
    return showcaseCollection;
}

-(ShowcaseCollection*)loadWebGLShowcases {
    
    // create new showcase collection
    ShowcaseCollection *showcaseCollection = [[ShowcaseCollection alloc] initWithNameAndDescription:@"WebGL Samples" descr:@"http://code.google.com/p/WebGLShowcases/"];
    
    [showcaseCollection insertShowcase:@"Aquarium" 
                          url:@"http://webglsamples.googlecode.com//hg/aquarium/aquarium.html"
                       author:@"By Greggman and Human Engines"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/aquarium/aquarium.jpg"];
    
    [showcaseCollection insertShowcase:@"Blob" 
                          url:@"http://webglsamples.googlecode.com//hg/blob/blob.html"
                       author:@"By Henrik Rydgård"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/blob/blob.jpg"];
    
    [showcaseCollection insertShowcase:@"Collectibles" 
                          url:@"http://webglsamples.googlecode.com//hg/collectibles/index.html"
                       author:@"By Human Engines"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/collectibles/collectibles.jpg"];

    [showcaseCollection insertShowcase:@"Dynamic Cubemap" 
                          url:@"http://webglsamples.googlecode.com//hg/dynamic-cubemap/dynamic-cubemap.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/dynamic-cubemap/dynamic-cubemap.jpg"];
    
    [showcaseCollection insertShowcase:@"Electricflower" 
                          url:@"http://webglsamples.googlecode.com//hg/electricflower/electricflower.html"
                       author:@"By Henrik Rydgård"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/electricflower/electricflower.jpg"];
    
    [showcaseCollection insertShowcase:@"Field" 
                          url:@"http://webglsamples.googlecode.com//hg/field/field.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/field/field.jpg"];
    
    [showcaseCollection insertShowcase:@"Fishtank" 
                          url:@"http://webglsamples.googlecode.com//hg/fishtank/fishtank.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/fishtank/fishtank.jpg"];
    
    [showcaseCollection insertShowcase:@"Halo" 
                          url:@"http://webglsamples.googlecode.com//hg/halo/halo.html"
                       author:@"By Kenneth Waters"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/halo/halo.jpg"];  
    
    [showcaseCollection insertShowcase:@"Imagesphere" 
                          url:@"http://webglsamples.googlecode.com//hg/imagesphere/imagesphere.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/imagesphere/imagesphere.jpg"];  
    
    [showcaseCollection insertShowcase:@"Lots-O-Images - Draw Elements" 
                          url:@"http://webglsamples.googlecode.com//hg/lots-o-images/lots-o-images-draw-elements.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/lots-o-images/lots-o-images-draw-elements.png"];
    
    [showcaseCollection insertShowcase:@"Lots-O-Images - BufferData" 
                          url:@"http://webglsamples.googlecode.com//hg/lots-o-images/lots-o-images-buffer-data.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/lots-o-images/lots-o-images-buffer-data.png"];
    
    [showcaseCollection insertShowcase:@"Lots-O-Images - BufferData Opaque" 
                          url:@"http://webglsamples.googlecode.com//hg/lots-o-images/lots-o-images-buffer-data-opaque.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/lots-o-images/lots-o-images-buffer-data-opaque.png"];
    
    [showcaseCollection insertShowcase:@"Lots-O-Objects - Draw Elements" 
                          url:@"http://webglsamples.googlecode.com//hg/lots-o-objects/lots-o-objects-draw-elements.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/lots-o-objects/lots-o-objects-draw-elements.png"];
    
    [showcaseCollection insertShowcase:@"Lots-O-Objects - Draw Elements With Alpha" 
                          url:@"http://webglsamples.googlecode.com//hg/lots-o-objects/lots-o-objects-draw-elements-with-alpha.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/lots-o-objects/lots-o-objects-draw-elements-with-alpha.png"];
    
    [showcaseCollection insertShowcase:@"Lots-O-Objects - Draw Elements Multisample" 
                          url:@"http://webglsamples.googlecode.com//hg/lots-o-objects/lots-o-objects-draw-elements-with-alpha-multisample.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/lots-o-objects/lots-o-objects-draw-elements-with-alpha.png"];
    
    
    [showcaseCollection insertShowcase:@"Multiple Views" 
                          url:@"http://webglsamples.googlecode.com//hg/multiple-views/multiple-views.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/multiple-views/multiple-views.png"];
    
    [showcaseCollection insertShowcase:@"Persistence" 
                          url:@"http://webglsamples.googlecode.com//hg/persistence/persistence.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/persistence/persistence.png"];
    
    [showcaseCollection insertShowcase:@"Spacerocks" 
                          url:@"http://webglsamples.googlecode.com//hg/spacerocks/spacerocks.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/spacerocks/spacerocks.jpg"];
    
    [showcaseCollection insertShowcase:@"Flexible Toon Shading" 
                          url:@"http://webglsamples.googlecode.com//hg/toon-shading/toon-shading.html"
                       author:@"By Greggman"
                       imgUrl:@"http://webglsamples.googlecode.com//hg/toon-shading/toon-shading.jpg"];

    return showcaseCollection;
}

-(ShowcaseCollection *)loadGLGEShowcases {
    // create new showcase collection
    ShowcaseCollection *showcaseCollection = [[ShowcaseCollection alloc] initWithNameAndDescription:@"GLGE Samples" descr:@"http://www.glge.org"];
    

    [showcaseCollection insertShowcase:@"Shaderinjection" 
                          url:@"http://www.glge.org/demos/shaderinjection/"
                       author:@"By Paul Brunt"
                       imgUrl:@""];
    
    [showcaseCollection insertShowcase:@"MD2 models" 
                          url:@"http://www.glge.org/demos/md2demo/"
                       author:@"By Paul Brunt"
                       imgUrl:@""];
    
    [showcaseCollection insertShowcase:@"Sky Fog Demo" 
                          url:@"http://www.glge.org/demos/skydemo/"
                       author:@"By Paul Brunt"
                       imgUrl:@""];
    
    return showcaseCollection;
}

@end
