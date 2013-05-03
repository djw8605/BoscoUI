//
//  AppDelegate.h
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "MasterViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic,strong) IBOutlet MasterViewController *masterViewController;

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSButton *AddClusterButton;

- (IBAction)AddClusterButtonClick:(id)sender;

@property (weak) IBOutlet NSScrollView *ClusterList;

@end
