//
//  Models.h
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Models : NSObject {
  NSArray *categories;
  NSArray *todos;
}

@property (nonatomic, retain) NSArray *categories;
@property (nonatomic, retain) NSArray *todos;

-(void)resetCategories;

@end
