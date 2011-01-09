//
//  DotoAppDelegate.h
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Models.h"

@interface DotoAppDelegate : NSObject <NSApplicationDelegate> {
  NSWindow *window;
  Models *models;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) Models *models;

@end
