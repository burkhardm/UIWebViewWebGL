//
//  LoadingView.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView {
    UIToolbar *toolbar;
    UIActivityIndicatorView *spinner;
    UILabel *label;
}

- (void) hideBar;
- (void) showBar;
@end
