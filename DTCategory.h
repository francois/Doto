//
//  DTCategory.h
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DTCategory : NSObject {
  NSString *name;
  NSArray *todos;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSArray *todos;

-(id)initWithName:(NSString *)aName;

@end
