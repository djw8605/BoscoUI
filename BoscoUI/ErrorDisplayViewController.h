//
//  ErrorDisplayViewController.h
//  BoscoUI
//
//  Created by Derek Weitzel on 5/6/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MAAttachedWindow.h"

@interface ErrorDisplayViewController : NSViewController {
    MAAttachedWindow *attachedWindow;
    NSWindow* parent_window;
    NSString* error_string;
}

- (void)setErrorText:(NSString*)text;
- (void)show;
- (void)close;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil window:(NSWindow *)window;
- (id)initWithWindow:(NSWindow *)window;

@property (assign) IBOutlet NSTextField *errorField;
@property (assign) IBOutlet NSView *errorView;


@property  NSPoint popupPoint;
@property  BOOL shown;

@end
