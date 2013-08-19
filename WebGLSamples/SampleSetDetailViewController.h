//
//  MasterViewSampleSetControllerViewController.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RenderViewController.h"
#import "ShowcaseCollection.h"
#import "Showcase.h"

@interface SampleSetDetailViewController : UITableViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) RenderViewController *detailViewController;
@property (strong, nonatomic) UIPopoverController *popoverController;
@property (strong, nonatomic) ShowcaseCollection *m_sampleSet;
@property (nonatomic, copy) NSString *documentsDirectory;
- (void)configureView;

@end
