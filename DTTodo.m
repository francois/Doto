//
//  DTTodo.m
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import "DTTodo.h"


@implementation DTTodo

@synthesize title;

-(id)init {
  if ((self = [super init])) {
    self.title = @"Explore things further";
  }

  return self;
}

-(void)dealloc {
  self.title = nil;
  [super dealloc];
}

@end
