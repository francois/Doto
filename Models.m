//
//  Models.m
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import "Models.h"
#import "DTCategory.h"

@implementation Models

@synthesize categories;

-(id)init {
  if (self = [super init]) {
    self.categories = [NSArray arrayWithObject:[[DTCategory alloc] init]];
  }

  return self;
}

-(void)dealloc {
  self.categories = nil;
  [super dealloc];
}

-(NSString *)description {
  return [self.categories description];
}

@end
