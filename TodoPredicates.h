//
//  TodoPredicates.h
//  Doto
//
//  Created by François Beausoleil on 11-01-09.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TodoPredicates : NSObject {
  NSString *filter;
}

@property (assign) IBOutlet NSArrayController *categories;
@property (assign) IBOutlet NSArrayController *todos;

@property (nonatomic, retain) NSPredicate *allPredicates;
@property (nonatomic, copy) NSString *filter;

-(IBAction)setSearchString:(id)sender;
-(void)rebuildPredicates;

-(IBAction)addTodo:(id)sender;

@end
