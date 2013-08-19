//
//  FullscreenViewController.m
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard, (c) 2011 Nathan de Vries. All rights reserved.
//

#import "FullscreenViewController.h"
#import "UIWebView+WebGL.h"

@implementation FullscreenViewController

@synthesize detailItem;
@synthesize webViewDidLoad;

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
        
        // Configure the view.
        [self configureView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the view.
    [self configureView];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        
        // Prepare WebView for WebGL Rendering
        UIWebView* webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        id hiddenbrowserView = [webView performSelector: @selector(_browserView)];
        id glWebView = [hiddenbrowserView performSelector:@selector(webView)];
        [glWebView _setWebGLEnabled:YES];  // iAd hack
        [webView setDelegate:self];
        
        // Assign current view to RenderView
        [self setView:webView];
        
        // Define Recognizer for double taps
        UITapGestureRecognizer *tapRecogizer =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        [tapRecogizer setDelegate:self];
        [tapRecogizer setNumberOfTouchesRequired:1];
        [tapRecogizer setNumberOfTapsRequired:2];
        [webView addGestureRecognizer:tapRecogizer];
        
        // Hide Status Bar
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
        
        // request endpoint url
        NSURLRequest* request = [NSURLRequest requestWithURL:[self.detailItem url]];
        [((UIWebView*)self.view) loadRequest:request];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void) handleDoubleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"fullscreen handleDoubleTap");
    [self dismissModalViewControllerAnimated:YES];
    
    // raise an event
    [[NSNotificationCenter defaultCenter] postNotificationName:@"onFullScreenDismissed" object:nil userInfo:nil];
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

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"FullscreenViewController.webViewDidFinishLoad");
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"FullscreenViewController.webViewDidStartLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"FullscreenViewController.didFailLoadWithError");
    NSLog(@"%@",error.description);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WebGL Rendering Error" message:error.description
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
