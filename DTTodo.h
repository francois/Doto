//
//  DTTodo.h
//  Doto
//
//  Created by François Beausoleil on 11-01-08.
//  Copyright 2011 Bloom Digital Platforms Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DTTodo : NSObject {
  NSString *title;
}

@property (nonatomic, copy) NSString *title;

@end
