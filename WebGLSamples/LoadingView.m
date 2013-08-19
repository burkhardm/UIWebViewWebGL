//
//  LoadingView.m
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView

- (id) init {
    self = [super init];
    if (self) {
        toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 416, 320, 44)];
        [toolbar setBarStyle:UIBarStyleBlackTranslucent];
        [self addSubview:toolbar];
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        spinner.frame = CGRectMake(20, 427, 20, 20);
        [spinner startAnimating];
        [self addSubview:spinner];
        label = [[UILabel alloc] initWithFrame:CGRectMake(48, 426, 76, 21)];
        label.text = @"Loading...";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        [self addSubview:label];
    }
    return self;
}

- (void) hideBar {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    toolbar.frame = CGRectMake(0, 460, 320, 44);
    spinner.frame = CGRectMake(20, 460, 20, 20);
    label.frame = CGRectMake(48, 460, 76, 21);
    [UIView commitAnimations];
}

- (void) showBar {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    toolbar.frame = CGRectMake(0, 416, 320, 44);
    spinner.frame = CGRectMake(20, 427, 20, 20);
    label.frame = CGRectMake(48, 426, 76, 21);
    [UIView commitAnimations];
}

@end
