//
//  RenderViewController.m
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard, (c) 2011 Nathan de Vries. All rights reserved.
//

#import "RenderViewController.h"
#import "Showcase.h"
#import "UIWebView+WebGL.h"
#import <QuartzCore/QuartzCore.h>


@implementation RenderViewController

@synthesize detailItem;
@synthesize detailDescriptionLabel;
@synthesize masterPopoverController;
@synthesize actionButton, popoverActionsheet;
@synthesize showcase;
@synthesize loadingView, webViewDidLoad;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // listen for the fullscreen being dismissed
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onFullScreenDimissed:) name:@"onFullScreenDismissed" object:nil];

    
    [self configureView];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        
        showcase = self.detailItem;
        
        if(![self.view isKindOfClass:[UIWebView class]]) {
        
            // Prepare WebView for WebGL Rendering
            UIWebView* webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            id hiddenbrowserView = [webView performSelector:@selector(_browserView)];
            id glWebView = [hiddenbrowserView performSelector:@selector(webView)];
            [glWebView _setWebGLEnabled:YES]; // iAd hack
            [webView setDelegate:self];
          
            // Assign current view to RenderView
            [self setView:webView];
            
            // Show Status Bar
            [[UIApplication sharedApplication] setStatusBarHidden:NO];
        }
        
        // request endpoint url
        webViewDidLoad = NO;    // Reset flag so that content can be loaded 
        NSURLRequest* request = [NSURLRequest requestWithURL:[self.detailItem url]];
        [((UIWebView*)self.view) loadRequest:request];
    }
}

#pragma mark - WebView Events


// Prevent the request of any web links on the WebGL page
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if(!webViewDidLoad) {
        webViewDidLoad = YES;
        return YES;
    }
    return NO;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"RenderViewController.webViewDidStartLoad");

    if(actionButton) 
    {
        [actionButton setEnabled:NO];
    }
    
    //[loadingView showBar];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"RenderViewController.webViewDidFinishLoad");  
    
    if(!actionButton)
    {
        actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showActionSheet:)];
        self.navigationItem.rightBarButtonItem = actionButton;
    }
    [actionButton setEnabled:YES];
    
    //[loadingView hideBar];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"RenderViewController.didFailLoadWithError");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WebGL Showcase - Load Failed" message:error.description
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}


-(IBAction)showActionSheet:(id)sender {
    
    if (popoverActionsheet && [popoverActionsheet isVisible]) {
    
        [popoverActionsheet dismissWithClickedButtonIndex:[popoverActionsheet cancelButtonIndex] animated:YES];
        return;
    }

    if(self.detailItem && [self.detailItem url]) {
        popoverActionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil   destructiveButtonTitle:@"Cancel" otherButtonTitles:@"View Fullscreen", @"Email Link", @"Share Link ...", nil];
    } 
    else 
    {
        popoverActionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil   destructiveButtonTitle:@"Cancel" otherButtonTitles:@"View Fullscreen", nil];
        
    }
    [popoverActionsheet showFromBarButtonItem:sender animated:YES];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
    switch (buttonIndex) {
        case 1: // Full Screen
            
            [self performSegueWithIdentifier:@"showFullScreen" sender:self];
            
            break;
        case 2: // Email link

            [self composeEmail];

            break;
        default:
            break;
    } 
    

}

- (void)composeEmail:(NSString*)subject descr:(NSString*)messageBody
{            
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:subject];
        [mailViewController setMessageBody:messageBody isHTML:NO];
        
        [self presentModalViewController:mailViewController animated:YES ];        
    }
    else {
        NSLog(@"Device is unable to send email in its current state.");
        NSString *recipients = @"";

            
        NSString *email = [NSString stringWithFormat:@"mailto:%@?subject=%@&body=%@", recipients, subject, messageBody];
        email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
    }
    
}


// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{ 
    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultSaved:
            break;
        case MFMailComposeResultSent:
            break;
        case MFMailComposeResultFailed:
            break;
            
        default:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email" message:@"Sending Email Failed - Unknown Error"
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
            
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"WebGL Samples", @"WebGL Samples");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showFullScreen"]) {
        
        // WebView is cleared by loading empty html content
        // WebView has to be reloaded after leaving fullscreen mode
        [((UIWebView*)self.view) loadHTMLString:@"<html><body></body></html>" baseURL:nil];
        
        // enter FullScreen mode
        [[segue destinationViewController] setDetailItem:showcase];
    }
}

// Message Handler to reload web content after leaving fullscreen mode
- (void) onFullScreenDimissed:(NSNotification*)n
{
    NSLog(@"onFullScreenDismissed");
    
    // reload render UIWebView
    NSURLRequest* request = [NSURLRequest requestWithURL:[showcase url]];
    [((UIWebView*)self.view) loadRequest:request]; 
}

@end
