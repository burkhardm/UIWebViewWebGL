//
//  DetailViewController.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "Showcase.h"
#import "LoadingView.h"

@class RenderViewController;

@interface RenderViewController : UIViewController <UISplitViewControllerDelegate, UIWebViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) Showcase* showcase;
@property (atomic) BOOL webViewDidLoad;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (nonatomic, retain) UIBarButtonItem *actionButton;
@property (nonatomic, retain) UIActionSheet *popoverActionsheet;
@property (nonatomic, retain) LoadingView *loadingView;
- (void)configureView;
-(IBAction)showActionSheet:(id)sender;
- (void)composeEmail;
- (void) onFullScreenDimissed:(NSNotification*)n;
@end
