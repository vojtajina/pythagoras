//
//  NumbersDescription.m
//  pythagoras
//
//  Created by Vojta Jína on 4/13/13.
//  Copyright (c) 2013 Vojta Jína. All rights reserved.
//

#import "NumbersDescription.h"

static NSArray *PERSONAL = nil;
static NSArray *ACTION = nil;
static NSArray *HERITAGE = nil;
static NSArray *INTERNAL = nil;
static NSArray *EXTERNAL = nil;
static NSArray *FAITH = nil;


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
  
  if (PERSONAL == nil) {
    PERSONAL = [[NSArray alloc] initWithObjects:
                NSLocalizedString(@"1_personal", nil),
                NSLocalizedString(@"2_personal", nil),
                NSLocalizedString(@"3_personal", nil),
                NSLocalizedString(@"4_personal", nil),
                NSLocalizedString(@"5_personal", nil),
                NSLocalizedString(@"6_personal", nil),
                NSLocalizedString(@"7_personal", nil),
                NSLocalizedString(@"8_personal", nil),
                NSLocalizedString(@"9_personal", nil),
                NSLocalizedString(@"11_personal", nil),
                NSLocalizedString(@"22_personal", nil),
                nil];

    ACTION = [[NSArray alloc] initWithObjects:
              NSLocalizedString(@"1_action", nil),
              NSLocalizedString(@"2_action", nil),
              NSLocalizedString(@"3_action", nil),
              NSLocalizedString(@"4_action", nil),
              NSLocalizedString(@"5_action", nil),
              NSLocalizedString(@"6_action", nil),
              NSLocalizedString(@"7_action", nil),
              NSLocalizedString(@"8_action", nil),
              NSLocalizedString(@"9_action", nil),
              NSLocalizedString(@"11_action", nil),
              NSLocalizedString(@"22_action", nil),
              nil];
    
    HERITAGE = [[NSArray alloc] initWithObjects:
                NSLocalizedString(@"1_heritage", nil),
                NSLocalizedString(@"2_heritage", nil),
                NSLocalizedString(@"3_heritage", nil),
                NSLocalizedString(@"4_heritage", nil),
                NSLocalizedString(@"5_heritage", nil),
                NSLocalizedString(@"6_heritage", nil),
                NSLocalizedString(@"7_heritage", nil),
                NSLocalizedString(@"8_heritage", nil),
                NSLocalizedString(@"9_heritage", nil),
                NSLocalizedString(@"11_heritage", nil),
                NSLocalizedString(@"22_heritage", nil),
                nil];
    
    INTERNAL = [[NSArray alloc] initWithObjects:
                NSLocalizedString(@"1_internal", nil),
                NSLocalizedString(@"2_internal", nil),
                NSLocalizedString(@"3_internal", nil),
                NSLocalizedString(@"4_internal", nil),
                NSLocalizedString(@"5_internal", nil),
                NSLocalizedString(@"6_internal", nil),
                NSLocalizedString(@"7_internal", nil),
                NSLocalizedString(@"8_internal", nil),
                NSLocalizedString(@"9_internal", nil),
                NSLocalizedString(@"11_internal", nil),
                NSLocalizedString(@"22_internal", nil),
                nil];
    
    EXTERNAL = [[NSArray alloc] initWithObjects:
                NSLocalizedString(@"1_external", nil),
                NSLocalizedString(@"2_external", nil),
                NSLocalizedString(@"3_external", nil),
                NSLocalizedString(@"4_external", nil),
                NSLocalizedString(@"5_external", nil),
                NSLocalizedString(@"6_external", nil),
                NSLocalizedString(@"7_external", nil),
                NSLocalizedString(@"8_external", nil),
                NSLocalizedString(@"9_external", nil),
                NSLocalizedString(@"11_external", nil),
                NSLocalizedString(@"22_external", nil),
                nil];
    
    FAITH = [[NSArray alloc] initWithObjects:
             NSLocalizedString(@"1_faith", nil),
             NSLocalizedString(@"2_faith", nil),
             NSLocalizedString(@"3_faith", nil),
             NSLocalizedString(@"4_faith", nil),
             NSLocalizedString(@"5_faith", nil),
             NSLocalizedString(@"6_faith", nil),
             NSLocalizedString(@"7_faith", nil),
             NSLocalizedString(@"8_faith", nil),
             NSLocalizedString(@"9_faith", nil),
             NSLocalizedString(@"11_faith", nil),
             NSLocalizedString(@"22_faith", nil),
             nil];
  }
  
  // generate array for table view
  _titles = [[NSArray alloc] initWithObjects:
             [NSString stringWithFormat:@"Personal #%u", _personal],
             [NSString stringWithFormat:@"Action #%u", _action],
             [NSString stringWithFormat:@"Heritage #%u", _heritage],
             [NSString stringWithFormat:@"Internal #%u", _internal],
             [NSString stringWithFormat:@"External #%u", _external],
             [NSString stringWithFormat:@"Faith #%u", _faith], nil];
  
  _descriptions = [[NSArray alloc] initWithObjects:
                   [PERSONAL objectAtIndex: [self normalize: _personal]],
                   [ACTION objectAtIndex: [self normalize: _action]],
                   [HERITAGE objectAtIndex: [self normalize: _heritage]],
                   [INTERNAL objectAtIndex: [self normalize: _internal]],
                   [EXTERNAL objectAtIndex: [self normalize: _external]],
                   [FAITH objectAtIndex: [self normalize: _faith]],
                   nil];
  
  return self;
}

- (NSUInteger)normalize:(NSUInteger)number {
  if (number == 11) {
    return 9;
  }
  if (number == 22) {
    return 10;
  }

  return number - 1;
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
