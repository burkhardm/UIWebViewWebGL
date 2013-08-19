//
//  UIWebView+WebGL.h
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard, 2011 Nathan de Vries. All rights reserved.
//


// Make internal method of UIWebView visible. 
@interface UIWebView()
- (void)_setWebGLEnabled:(BOOL)newValue;
@end