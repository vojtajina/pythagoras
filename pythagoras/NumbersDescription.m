//
//  NumbersDescription.m
//  pythagoras
//
//  Created by Vojta Jína on 4/13/13.
//  Copyright (c) 2013 Vojta Jína. All rights reserved.
//

#import "NumbersDescription.h"



@implementation NumbersDescription

- (id)initForName:(NSString *)firstName
         lastName:(NSString *)lastName {
  self = [super init];
  
  _first = firstName;
  _last = lastName;

  _personal = 0;
  _action = 0;
  _heritage = 0;
  _internal = 0;
  _external = 0;
  _faith = 0;
  
  firstName = [self removeSpecialChars:firstName];
  lastName = [self removeSpecialChars:lastName];
  
  for (NSInteger charIdx = 0; charIdx < firstName.length; charIdx++) {
    unichar character = [firstName characterAtIndex:charIdx];
    NSUInteger value = [self charValue: character];
    
    _personal = _personal + value;
    _action = _action + value;
    if ([self isVowel: character]) {
      _internal = _internal + value;
    } else {
      _external = _external + value;
    }
  }

  for (NSInteger charIdx = 0; charIdx < lastName.length; charIdx++) {
    unichar character = [lastName characterAtIndex:charIdx];
    NSUInteger value = [self charValue: character];
    
    _personal = _personal + value;
    _heritage = _heritage + value;
    
    if ([self isVowel: character]) {
      _internal = _internal + value;
    } else {
      _external = _external + value;
    }
  }
  
  _personal = [self sum:_personal];
  _action = [self sum:_action];
  _heritage = [self sum:_heritage];
  _internal = [self sum:_internal];
  _external = [self sum:_external];
  _faith = [self sum:_internal+_external];
  
  return self;
}

- (NSUInteger)charValue:(unichar)character {
  return ((character - 97) % 9) + 1;
}

- (bool)isVowel:(unichar)ch {
  if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
    return true;
  }
  
  return false;
}

- (NSUInteger)sum:(NSUInteger)number {
  if (number < 10) {
    return number;
  }
  
  if (number == 11 || number == 22) {
    return number;
  }

  NSUInteger sum = 0;

  while(number >= 10) {
    sum = sum + (number % 10);
    number = number / 10;
  }
  
  return [self sum:sum + number];
}

- (NSString *)removeSpecialChars:(NSString *)str {
  str = [str lowercaseString];
  NSData *temp = [str dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
  return [[NSString alloc] initWithData:temp encoding:NSASCIIStringEncoding];
}


@end
