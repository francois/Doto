//
//  DTCategory.m
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import "DTCategory.h"
#import "DTTodo.h"

@implementation DTCategory

@synthesize name, todos;

-(id)init {
  return [self initWithName:@"New Category"];
}

-(id)initWithName:(NSString *)aName {
  if ((self = [super init])) {
    self.name = aName;
    self.todos = [NSArray array];
  }

  return self;
}

-(void)dealloc {
  self.name = nil;
  self.todos = nil;

  [super dealloc];
}

-(NSString *)description {
  return [NSString stringWithFormat:@"%@ (%d todos)", name, [self.todos count]];
}

@end
