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

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Save every 2 minutes
  [[NSRunLoop currentRunLoop] addTimer:[NSTimer timerWithTimeInterval:2.0*60.0 target:self selector:@selector(save) userInfo:NULL repeats:YES]
                               forMode:NSDefaultRunLoopMode];

  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

  for(NSString *path in paths) {
    NSLog(@"Checking if '%@' exists and is a file", [path stringByAppendingPathComponent:@"Doto"]);
    if ([[NSFileManager defaultManager] isReadableFileAtPath:[path stringByAppendingPathComponent:@"Doto"]]) {
      id obj = [NSUnarchiver unarchiveObjectWithFile:[path stringByAppendingPathComponent:@"Doto"]];
      if (obj) {
        NSLog(@"Yup, and it was my stuff");
        self.models = (Models *)obj;
        return;
      }
    }
  }

  NSLog(@"No previous save file found - generating new data");
  self.models = [[Models alloc] init];
}

-(IBAction)save {
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSError *error;

  NSLog(@"-[DotoAppDelegate save] - paths: %@", paths);

  for(NSString *path in paths) {
    NSLog(@"Checking if we can save at '%@'", path);
    if (![[NSFileManager defaultManager] createDirectoryAtPath:path
                                   withIntermediateDirectories:YES
                                                    attributes:NULL
                                                         error:&error]) {
      NSLog(@"Failed to create directories at '%@': %@", path, error);
      if (error) [NSApp presentError:error];
      continue;
    }

    if ([NSArchiver archiveRootObject:models toFile:[path stringByAppendingPathComponent:@"Doto"]]) {
      NSLog(@"Saved to '%@'", [path stringByAppendingPathComponent:@"Doto"]);
      return;
    }
  }
}

-(IBAction)bump:(id)sender {
  [self.models resetCategories];
}

@end
