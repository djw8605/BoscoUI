//
//  AddClusterWindowController.m
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import "AddClusterWindowController.h"


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
    

}

- (IBAction)connectButtonClick:(id)sender {
    
    if ( [[self.hostnameBox stringValue] length] == 0 ) {
        NSColor* backgroundColor = [NSColor colorWithCalibratedHue:0.983 saturation:0.43 brightness:0.99 alpha:1.0];
        [self.hostnameBox setDrawsBackground:TRUE];
        [self.hostnameBox setBackgroundColor:[NSColor clearColor]];
        [self.hostnameBox setBackgroundColor:backgroundColor];
    }
    
}


@end
