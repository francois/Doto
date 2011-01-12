//
//  DTTodo.m
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import "DTTodo.h"


@implementation DTTodo

@synthesize category, title;

-(id)init {
  if ((self = [super init])) {
    self.category = nil;
    self.title = @"Todo";
  }

  return self;
}

-(void)dealloc {
  self.category = nil;
  self.title = nil;
  [super dealloc];
}

-(NSString *)description {
  return [NSString stringWithFormat:@"[Todo category=%@, title=%@]", self.category, self.title];
}

@end
