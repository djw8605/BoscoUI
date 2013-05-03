//
//  AppDelegate.m
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import "AppDelegate.h"
#import "ClusterData.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //ClusterData *cluster1 = [[ClusterData alloc] initWithName:@"New Cluster" lrms:@"pbs" status:@"OK"];
 
    NSMutableArray *clusters = [ClusterData GetClusters];
    //NSMutableArray *clusters = [NSMutableArray arrayWithObjects:cluster1, nil];
    
    
    // Insert code here to initialize your application
    self.masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    self.masterViewController.clusters = clusters;
    
    // 2. Add the view controller to the Window's content view
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    
    
    
}







@end
