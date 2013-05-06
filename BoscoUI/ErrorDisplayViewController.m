//
//  ErrorDisplayViewController.m
//  BoscoUI
//
//  Created by Derek Weitzel on 5/6/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import "ErrorDisplayViewController.h"

@interface ErrorDisplayViewController ()

@end

@implementation ErrorDisplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil window:(NSWindow *)window
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        parent_window = window;
    }
    
    return self;
}

- (id)initWithWindow:(NSWindow *)window {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Initialization code here.
        parent_window = window;
    }
    
    return self;
}


- (void)setErrorText:(NSString*)text {
    
    error_string = [[NSString alloc] initWithString:text];
}

@synthesize popupPoint;

- (void)show {
    
    if (attachedWindow) {
        // Remove the window
        [parent_window removeChildWindow:attachedWindow];
        [attachedWindow orderOut:self];
        attachedWindow = nil;
    }
    self.shown = TRUE;
    //NSLog(@"x = %f, y = %f", popupPoint.x, popupPoint.y);
    NSTextField *errorTextField = [[NSTextField alloc] initWithFrame:NSMakeRect(0.0, 0.0, 100, 50)];
    [errorTextField setStringValue:error_string];
    [errorTextField setEditable:FALSE];
    [errorTextField setBackgroundColor:[NSColor clearColor]];
    [errorTextField setSelectable:FALSE];
    [errorTextField setDrawsBackground:FALSE];
    [errorTextField setBezeled:FALSE];
    [errorTextField setTextColor:[NSColor whiteColor]];
    [errorTextField setAlignment:NSCenterTextAlignment];
    
    
    
    // Create the MAAttachedWindow
    attachedWindow = [[MAAttachedWindow alloc] initWithView:errorTextField attachedToPoint:popupPoint inWindow:parent_window onSide:MAPositionRight atDistance:0.0];
    
    [parent_window addChildWindow:attachedWindow ordered:NSWindowAbove];
    
    
    
}

- (void)close {
    self.shown = FALSE;
    if(attachedWindow) {
        [parent_window removeChildWindow:attachedWindow];
        attachedWindow = nil;
    }
    
}


@end
