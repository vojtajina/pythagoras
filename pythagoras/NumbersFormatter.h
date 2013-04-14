//
//  NumbersFormatter.h
//  pythagoras
//
//  Created by Vojta Jína on 4/14/13.
//  Copyright (c) 2013 Vojta Jína. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NumbersDescription.h"

@interface NumbersFormatter : NSObject
// public
@property(nonatomic, assign) NSUInteger rowsCount;
@property(nonatomic, copy) NSString *title;

// private
@property(nonatomic, strong) NSArray *titles;
@property(nonatomic, strong) NSArray *descriptions;


// public
- (id)initWithDescription:(NumbersDescription *)description;
- (NSString *)titleAtIndex:(NSUInteger)index;
- (NSString *)descriptionAtIndex:(NSUInteger)index;


// private
- (NSUInteger)normalize:(NSUInteger)number;
@end
