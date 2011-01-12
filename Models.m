//
//  Models.m
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import "Models.h"
#import "DTCategory.h"
#import "DTTodo.h"

@implementation Models

@synthesize categories, todos;

-(id)init {
  if (self = [super init]) {
    self.categories = [NSArray arrayWithObject:[[DTCategory alloc] initWithName:@"Inbox"]];
    self.todos = [NSArray array];
  }

  return self;
}

-(void)dealloc {
  self.categories = nil;
  self.todos = nil;
  [super dealloc];
}

-(void)resetCategories {
  NSLog(@"-[Models resetCategories]");
  NSMutableSet *names = [NSMutableSet set];
  for(DTTodo *todo in self.todos) {
    [names addObject:todo.category];
  }
  NSLog(@"%@", names);
}

@end
