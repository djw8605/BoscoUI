//
//  AddClusterWindowController.h
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import <Cocoa/Cocoa.h>



@interface AddClusterWindowController : NSWindowController

@property (assign) IBOutlet NSWindow *addClusterWindow;
@property (assign) IBOutlet NSProgressIndicator *progressIndicator;

// Text boxes
@property (assign) IBOutlet NSTextField *hostnameBox;
@property (assign) IBOutlet NSTextField *usernameBox;
@property (assign) IBOutlet NSTextField *passwordBox;

// Click buttons
- (IBAction)connectButtonClick:(id)sender;

@end
