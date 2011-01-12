//
//  TodoPredicates.m
//  Doto
//
//  Created by François Beausoleil on 11-01-09.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import "TodoPredicates.h"
#import "DTTodo.h"

@implementation TodoPredicates

@synthesize filter, allPredicates, categories, todos;

-(void)awakeFromNib {
  [self.categories addObserver:self forKeyPath:@"selectionIndexes" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (object == self.categories && [keyPath isEqual:@"selectionIndexes"]) {
    [self rebuildPredicates];
    return;
  }

  [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

-(IBAction)setSearchString:(id)sender {
  self.filter = [sender stringValue];
  [self rebuildPredicates];
}

-(void)rebuildPredicates {
  NSPredicate *categoryPredicate;
  NSPredicate *filterPredicate;

  categoryPredicate = [NSPredicate predicateWithFormat:@"%K IN %@", @"category", [[self.categories selectedObjects] valueForKeyPath:@"name"]];

  if (filter == nil || [filter isEqual:@""]) {
    filterPredicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
  } else {
    filterPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", @"title", filter];
  }

  self.allPredicates = [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:categoryPredicate, filterPredicate, nil]];
  NSLog(@"allPredicates: %@", [self.allPredicates predicateFormat]);
}

-(void)dealloc {
  [self.categories removeObserver:self forKeyPath:@"selectionIndexes"];

  self.allPredicates = nil;
  self.filter = nil;
  [super dealloc];
}

-(IBAction)addTodo:(id)sender {
  NSLog(@"adding todo");
  DTTodo *todo = [[DTTodo alloc] init];
  todo.category = [[[self.categories selectedObjects] objectAtIndex:0] name];

  [self.todos addObject:todo];
  [todo release];
  [self rebuildPredicates];
}

@end
