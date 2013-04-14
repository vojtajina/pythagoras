//
//  NumbersFormatter.m
//  pythagoras
//
//  Created by Vojta Jína on 4/14/13.
//  Copyright (c) 2013 Vojta Jína. All rights reserved.
//

#import "NumbersFormatter.h"
#import "NumbersDescription.h"

// TODO(vojta): handle 0 numbers (eg. one name not filled out)
// TODO(vojta): show more details
// (http://www.cocoanetics.com/2011/03/expandingcollapsing-tableview-sections/)

static NSArray *PERSONAL = nil;
static NSArray *ACTION = nil;
static NSArray *HERITAGE = nil;
static NSArray *INTERNAL = nil;
static NSArray *EXTERNAL = nil;
static NSArray *FAITH = nil;

@implementation NumbersFormatter

- (id)initWithDescription:(NumbersDescription *)description {
  self = [super init];

  if (PERSONAL == nil) {
    [self initConstants];
  }

  // generate array for table view
  _titles = [[NSArray alloc] initWithObjects:
             [NSString stringWithFormat:@"Personal #%u", description.personal],
             [NSString stringWithFormat:@"Action #%u", description.action],
             [NSString stringWithFormat:@"Heritage #%u", description.heritage],
             [NSString stringWithFormat:@"Internal #%u", description.internal],
             [NSString stringWithFormat:@"External #%u", description.external],
             [NSString stringWithFormat:@"Fate #%u", description.faith], nil];

  _descriptions = [[NSArray alloc] initWithObjects:
                   [PERSONAL objectAtIndex: [self normalize: description.personal]],
                   [ACTION objectAtIndex: [self normalize: description.action]],
                   [HERITAGE objectAtIndex: [self normalize: description.heritage]],
                   [INTERNAL objectAtIndex: [self normalize: description.internal]],
                   [EXTERNAL objectAtIndex: [self normalize: description.external]],
                   [FAITH objectAtIndex: [self normalize: description.faith]],
                   nil];

  _title = [NSString stringWithFormat:@"Numbers for %@ %@", description.first, description.last];
  _rowsCount = _titles.count;
  

  return self;
}

- (NSString *)titleAtIndex:(NSUInteger)index {
  return [_titles objectAtIndex:index];
}

- (NSString *)descriptionAtIndex:(NSUInteger)index {
  return [_descriptions objectAtIndex:index];
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

- (void)initConstants {
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

@end
