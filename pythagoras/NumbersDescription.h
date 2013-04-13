//
//  NumbersDescription.h
//  pythagoras
//
//  Created by Vojta Jína on 4/13/13.
//  Copyright (c) 2013 Vojta Jína. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumbersDescription : NSObject
  @property(nonatomic, copy) NSString *first;
  @property(nonatomic, copy) NSString *last;

  @property(nonatomic, assign) NSUInteger personal;
  @property(nonatomic, assign) NSUInteger action;
  @property(nonatomic, assign) NSUInteger heritage;
  @property(nonatomic, assign) NSUInteger internal;
  @property(nonatomic, assign) NSUInteger external;
  @property(nonatomic, assign) NSUInteger faith;

- (id)initForName:(NSString *)firstName
         lastName:(NSString *)lastName;

- (NSUInteger)normalize:(NSUInteger)number;
- (NSUInteger)charValue:(unichar)character;
- (bool)isVowel:(unichar)character;
- (NSUInteger)sum:(NSUInteger)number;
- (NSString *)removeSpecialChars:(NSString *)str;


// FORMATTING

@property(nonatomic, strong) NSArray *titles;
@property(nonatomic, strong) NSArray *descriptions;

@end
