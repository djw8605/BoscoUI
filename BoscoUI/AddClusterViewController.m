//
//  AddClusterWindowController.m
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import "AddClusterViewController.h"
#import "ClusterData.h"


@interface AddClusterViewController ()

@end

@implementation AddClusterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        
        error_display = [[ErrorDisplayViewController alloc] initWithWindow:[[self view] window]];
    }
    
    return self;
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
