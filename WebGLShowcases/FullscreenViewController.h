//
//  FullscreenViewController.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullscreenViewController : UIViewController<UIWebViewDelegate,UIGestureRecognizerDelegate>

@property (strong, nonatomic) id detailItem;
@property (atomic) BOOL webViewDidLoad;

- (void) configureView;
- (void) handleDoubleTap:(UITapGestureRecognizer *)recognizer;

@end
