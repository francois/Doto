//
//  TodoPredicates.m
//  Doto
//
//  Created by François Beausoleil on 11-01-09.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import "TodoPredicates.h"


@implementation TodoPredicates

@synthesize filter, allPredicates;

-(IBAction)setSearchString:(id)sender {
  self.filter = [sender stringValue];
  [self rebuildPredicates];
}

-(void)rebuildPredicates {
  if (filter == nil || [filter isEqual:@""]) {
    self.allPredicates = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
  } else {
    self.allPredicates = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", @"title", filter];
  }
}

-(void)dealloc {
  self.allPredicates = nil;
  self.filter = nil;
  [super dealloc];
}

@end
