//
//  ClusterData.m
//  BoscoUI
//
//  Created by Derek Weitzel on 5/2/13.
//  Copyright (c) 2013 Derek Weitzel. All rights reserved.
//

#import "ClusterData.h"

@implementation ClusterData

- (id)initWithName:(NSString*)name lrms:(NSString*)lrms status:(NSString*)status {
    
    if ((self = [super init])) {
        self.name = name;
        self.lrms = lrms;
        self.status = status;
        
    }
    return self;
}


+ (NSMutableArray*)GetClusters {
    
    // Run the command: bosco_cluster -l after sourcing bosco_setenv.
    NSTask *task;
    task = [[NSTask alloc] init];
    
    NSMutableString *bosco_cluster = [[NSMutableString alloc] init];
    [bosco_cluster appendString:NSHomeDirectory()];
    [bosco_cluster appendString:@"/bosco/bin/bosco_cluster"];
    [task setLaunchPath:bosco_cluster];
    //[task setLaunchPath: @"/bin/bash"];
    
    NSMutableDictionary *envdict = [ClusterData SetEnvironment];
    
    [task setEnvironment:envdict];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-l", nil];
    [task setArguments: arguments];
    
    // Stdout pipe
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    [task setStandardInput:[NSPipe pipe]];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    // Stderr pipe
    NSPipe *stderrpipe;
    stderrpipe = [NSPipe pipe];
    [task setStandardError:stderrpipe];
    
    NSFileHandle *stderrfile;
    stderrfile = [stderrpipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    //NSLog (@"grep returned:\n%@", string);
    
    NSArray *cluster_list = [string componentsSeparatedByString:@"\n"];
    
    NSMutableArray *clusters = [[NSMutableArray alloc] init];
    for (int i = 0; i < [cluster_list count]; i++) {
        if ([(NSString*)[cluster_list objectAtIndex:i] length] == 0) break;
        //NSLog(@"Now doing: %@", (NSString*)[cluster_list objectAtIndex:i]);
        ClusterData *cluster = [[ClusterData alloc] initWithName:[cluster_list objectAtIndex:i] lrms:@"" status:@"OK"];
        [clusters addObject:cluster];
    }
    
    return clusters;

    
}


+ (NSMutableDictionary*)SetEnvironment {
    
    /*
     CONDOR_CONFIG="/Users/derekweitzel/bosco/etc/condor_config"
     export CONDOR_CONFIG
     PATH="/Users/derekweitzel/bosco/bin:/Users/derekweitzel/bosco/sbin:$PATH"
     export PATH
     */
    NSMutableString *config_dir = [[NSMutableString alloc] init];
    [config_dir appendString:NSHomeDirectory()];
    [config_dir appendString:@"/bosco/etc/condor_config"];
    
    NSMutableString *path_dir = [[NSMutableString alloc] init];
    [path_dir appendString:NSHomeDirectory()];
    [path_dir appendString:@"/bosco/bin:"];
    [path_dir appendString:NSHomeDirectory()];
    [path_dir appendString:@"/bosco/sbin:"];
    [path_dir appendString:[[[NSProcessInfo processInfo]environment]objectForKey:@"PATH"]];
    //[path_dir appendString:[task.environment objectForKey:@"PATH" ]];
    
    //NSLog(@"%@", config_dir);
    //NSLog(@"%@", path_dir);
    NSMutableDictionary *envdict = [[NSMutableDictionary alloc] init];
    [envdict setDictionary:[[NSProcessInfo processInfo]environment]];
    [envdict setObject:@"CONDOR_CONFIG" forKey:config_dir];
    [envdict setObject:@"PATH" forKey:path_dir];
    
    return envdict;
    
    
}

+ (BOOL)addClusterWithHostname:(NSString*)hostname lrms:(NSString*)lrms username:(NSString*)username password:(NSString*)password {
    
    NSMutableDictionary *envdict = [ClusterData SetEnvironment];
    
    
    return TRUE;
    
}



@end
