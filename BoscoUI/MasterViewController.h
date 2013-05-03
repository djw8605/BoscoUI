//
//  MasterViewController.h
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AddClusterWindowController.h"

@interface MasterViewController : NSViewController {
    AddClusterWindowController* addClusterWindow;
}


- (IBAction)addClusterButtonClick:(id)sender;

@property (strong) NSMutableArray *clusters;
@property (nonatomic, strong) IBOutlet NSImageView* imageView;
@property (weak) IBOutlet NSButton *addClusterButton;


@end
