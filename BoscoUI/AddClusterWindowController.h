//
//  AddClusterWindowController.h
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ErrorDisplayViewController.h"


@interface AddClusterWindowController : NSWindowController
{
    ErrorDisplayViewController *error_display;
    
}

@property (assign) IBOutlet NSWindow *addClusterWindow;
@property (assign) IBOutlet NSProgressIndicator *progressIndicator;
@property (assign) IBOutlet NSButton *connectButton;

// Text boxes
@property (assign) IBOutlet NSTextField *hostnameBox;
@property (assign) IBOutlet NSTextField *usernameBox;
@property (assign) IBOutlet NSTextField *passwordBox;
@property (assign) IBOutlet NSTextField *lrmsBox;

// Click buttons
- (IBAction)connectButtonClick:(id)sender;
- (IBAction)cancelButtonClick:(id)sender;

// Utility functions
- (void)setErrorForTextField:(NSTextField*)errorField errorMessage:(NSString*)errorMessage;

@end
