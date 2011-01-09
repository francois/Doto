//
//  DotoAppDelegate.m
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import "DotoAppDelegate.h"

@implementation DotoAppDelegate

@synthesize window, models;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  self.models = [[Models alloc] init];
  NSLog(@"models: %@", models);
}

@end
