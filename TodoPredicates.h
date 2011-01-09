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

@property (nonatomic, retain) NSPredicate *allPredicates;
@property (nonatomic, copy) NSString *filter;

-(IBAction)setSearchString:(id)sender;
-(void)rebuildPredicates;

@end