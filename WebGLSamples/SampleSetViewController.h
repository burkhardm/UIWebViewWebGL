//
//  SampleSetViewController.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleSetDetailViewController.h"
#import "ShowcaseCollectionController.h"
#import "ShowcaseCollection.h"

@interface SampleSetViewController : UITableViewController

@property(nonatomic, strong) ShowcaseCollectionController *sampleSetController;

@end
