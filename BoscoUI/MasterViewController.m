//
//  MasterViewController.m
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import "MasterViewController.h"
#import "ClusterData.h"
#import "AddClusterWindowController.h"



@implementation MasterViewController


- (void)awakeFromNib
{
    NSLog(@"Creating stuff");
    NSString *inFilePath = @"/Users/derekweitzel/BoscoUI/BoscoUI/BoscoUI/Images/BOSCO1.png";
    NSImage *testImage = [[NSImage alloc] initWithContentsOfFile:inFilePath];
    
    [self.imageView setImage:testImage];

    
    
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
        cellView.textField.stringValue = clusterDoc.name;
        return cellView;
    }
    NSLog(@"Called view");
    return cellView;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    NSLog(@"Called count, %li", [self.clusters count]);
    return [self.clusters count];
    
}


- (IBAction)addClusterButtonClick:(id)sender {
    
    
    addClusterWindow = [[AddClusterWindowController alloc] initWithWindowNibName:@"AddClusterWindowController"];
    [addClusterWindow showWindow:self];
}
@end
