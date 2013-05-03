//
//  ClusterData.h
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClusterData : NSObject

@property (strong) NSString *name;
@property (strong) NSString *lrms;
@property (strong) NSString *status;

- (id)initWithName:(NSString*)name lrms:(NSString*)lrms status:(NSString*)status;

+ (NSMutableArray*)GetClusters;

@end
