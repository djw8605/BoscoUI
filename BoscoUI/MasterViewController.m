//
//  MasterViewController.m
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import "MasterViewController.h"
#import "ClusterData.h"
#import "AddClusterViewController.h"



@implementation MasterViewController


- (void)awakeFromNib
{
    NSMutableString *image_path = [[NSMutableString alloc] initWithString:[[NSBundle mainBundle] bundlePath]];
    [image_path appendString:@"/"];
    [image_path appendString:@"Contents/Resources/BOSCO1.png"];
    //NSString *inFilePath = @"/Users/derekweitzel/BoscoUI/BoscoUI/BoscoUI/Images/BOSCO1.png";
    NSImage *testImage = [[NSImage alloc] initWithContentsOfFile:image_path];
    
    //cellView.imageView.image = bugDoc.thumbImage;
    image_path = [[NSMutableString alloc] initWithString:[[NSBundle mainBundle] bundlePath]];
    [image_path appendString:@"/"];
    [image_path appendString:@"Contents/Resources/data-center.png"];
    //NSString *inFilePath = @"/Users/derekweitzel/BoscoUI/BoscoUI/BoscoUI/Images/BOSCO1.png";
    NSImage *data_center = [[NSImage alloc] initWithContentsOfFile:image_path];
    [data_center setSize:NSMakeSize(64, 64)];
    [data_center setScalesWhenResized:TRUE];
    
    [self.imageView setImage:testImage];
    
    // Initialize the side bar
    if (initializedSidebar != TRUE) {
        [self.sideBar setLayoutMode:ECSideBarLayoutTop];
        NSImage *selImage =[self buildSelectionImage];
        [self.sideBar setSelectionImage:selImage];
        
        self.sideBar.animateSelection = YES;
        self.sideBar.sidebarDelegate = self;
        [self.sideBar addButtonWithTitle:@"Clusters" image:data_center];
        //[self.sideBar addButtonWithTitle:@"Clusters"];
        [self.sideBar addButtonWithTitle:@"Jobs"];
        [self.sideBar selectButtonAtRow:0];
        
        self.sideBar.noiseAlpha = 0.04;
        NSLog(@"starting...");
        initializedSidebar = TRUE;
    }
    
    
    self.clustersView.frame  = NSMakeRect(120, 0, 480, 400);
    self.jobsView.frame  = NSMakeRect(120, 0, 480, 400);
    [self.view addSubview:self.clustersView];
    
    // Add the Add Cluster View
    addClusterWindowTop = [[AddClusterViewController alloc] initWithNibName:@"AddClusterViewController" bundle:nil];
    [addClusterWindowTop view].frame = NSMakeRect(260, 60, 215, 300);
    [self.clustersView addSubview:[addClusterWindowTop view]];
    
    
}


-(NSImage*)buildSelectionImage
{
	// Create the selection image on the fly, instead of loading from a file resource.
	NSInteger imageWidth=12, imageHeight=22;
	NSImage* destImage = [[NSImage alloc] initWithSize:NSMakeSize(imageWidth,imageHeight)];
	[destImage lockFocus];
	
	
	
	// Constructing the path
    NSBezierPath *triangle = [NSBezierPath bezierPath];
	[triangle setLineWidth:1.0];
    [triangle moveToPoint:NSMakePoint(imageWidth+1, 0.0)];
    [triangle lineToPoint:NSMakePoint( 0, imageHeight/2.0)];
    [triangle lineToPoint:NSMakePoint( imageWidth+1, imageHeight)];
    [triangle closePath];
	[[NSColor controlColor] setFill];
	[[NSColor darkGrayColor] setStroke];
	[triangle fill];
	[triangle stroke];
	[destImage unlockFocus];
	return destImage;
}


-(void)sideBar:(EDSideBar*)tabBar didSelectButton:(NSInteger)button {

    NSLog(@"Clicked Button %li", (long)button);
    if (button == 0) {
        [self.clustersView removeFromSuperview];
        [self.jobsView removeFromSuperview];
        [self.view addSubview:self.clustersView];
    } else if (button == 1) {
        [self.clustersView removeFromSuperview];
        [self.jobsView removeFromSuperview];
        [self.view addSubview:self.jobsView];
    }
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        

    }
    
    return self;
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    
    // Get a new ViewCell
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    // Since this is a single-column table view, this would not be necessary.
    // But it's a good practice to do it in order by remember it when a table is multicolumn.
    if( [tableColumn.identifier isEqualToString:@"ClustersColumn"] )
    {
        ClusterData *clusterDoc = [self.clusters objectAtIndex:row];
        //cellView.imageView.image = bugDoc.thumbImage;
        NSMutableString *image_path = [[NSMutableString alloc] initWithString:[[NSBundle mainBundle] bundlePath]];
        [image_path appendString:@"/"];
        [image_path appendString:@"Contents/Resources/status_ok.png"];
        //NSString *inFilePath = @"/Users/derekweitzel/BoscoUI/BoscoUI/BoscoUI/Images/BOSCO1.png";
        NSImage *testImage = [[NSImage alloc] initWithContentsOfFile:image_path];

        cellView.textField.stringValue = clusterDoc.name;
        cellView.imageView.image = testImage;
        return cellView;
    }
    NSLog(@"Called view");
    return cellView;
}


- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    
    NSInteger selectedRow = [self.clustersTable selectedRow];
    NSLog(@"You selected row: %li", (long)selectedRow);
    
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    NSLog(@"Called count, %li", [self.clusters count]);
    return [self.clusters count];
    
}


- (IBAction)addClusterButtonClick:(id)sender {
    
    //NSLog(@"Button click");
    //addClusterWindowTop = [[AddClusterViewController alloc] initWithWindowNibName:@"AddClusterWindowController"];
    //[addClusterWindowTop showWindow:self];
    //[self.addClusterButton ];
    
    //[addClusterWindow makeKeyAndOrderFront:self.addClusterButton];
}
@end
