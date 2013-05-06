//
//  AddClusterWindowController.m
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import "AddClusterWindowController.h"
#import "ClusterData.h"


@interface AddClusterWindowController ()

@end

@implementation AddClusterWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        
        
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self.progressIndicator incrementBy:20.0];
    [self.addClusterWindow makeKeyWindow];
    [self.addClusterWindow makeKeyAndOrderFront:self];
    
    // Change button appearance
    //[self.connectButton setBezelStyle:NSRoundRectBezelStyle];
    error_display = [[ErrorDisplayViewController alloc] initWithWindow:self.addClusterWindow];
    

}

- (void)setErrorForTextField:(NSTextField*)errorField errorMessage:(NSString*)errorMessage {
    NSColor* backgroundColor = [NSColor colorWithCalibratedHue:0.983 saturation:0.43 brightness:0.99 alpha:1.0];
    [errorField setDrawsBackground:TRUE];
    [errorField setBackgroundColor:[NSColor clearColor]];
    [errorField setBackgroundColor:backgroundColor];
    
    if (!error_display.shown) {
        [error_display setErrorText:errorMessage];
        NSPoint point = NSMakePoint(NSMaxX([errorField frame]), NSMidY([errorField frame]));
        error_display.popupPoint = point;
        [error_display show];
    }
    
    
}

- (IBAction)connectButtonClick:(id)sender {
    
    BOOL error = FALSE;
    [error_display close];
    
    if ( [[self.hostnameBox stringValue] length] == 0 ) {
        [self setErrorForTextField:self.hostnameBox errorMessage:@"Empty Hostname"];
        // Think about adding a tool tip
        
        
        error = TRUE;
    }
    
    if ( [[self.usernameBox stringValue] length] == 0 ) {
        [self setErrorForTextField:self.usernameBox errorMessage:@"Username empty"];
        // Think about adding a tool tip
        
        error = TRUE;
    }
    
    if ( [[self.passwordBox stringValue] length] == 0 ) {
        [self setErrorForTextField:self.passwordBox errorMessage:@"Password empty"];
        // Think about adding a tool tip
        
        error = TRUE;
    }
    
    if ( [[self.lrmsBox stringValue] length] == 0 ) {
        [self setErrorForTextField:self.lrmsBox errorMessage:@"Scheduler empty"];
        // Think about adding a tool tip
        
        error = TRUE;
    }

    if (error) {
        return;
    }

    [ClusterData addClusterWithHostname:[self.hostnameBox stringValue] lrms:[self.lrmsBox stringValue]  username:[self.usernameBox stringValue] password:[self.passwordBox stringValue]];

}

- (IBAction)cancelButtonClick:(id)sender {
    [self.addClusterWindow close];

    
}


@end
