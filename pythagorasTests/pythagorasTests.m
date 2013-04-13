//
//  pythagorasTests.m
//  pythagorasTests
//
//  Created by Vojta Jína on 4/13/13.
//  Copyright (c) 2013 Vojta Jína. All rights reserved.
//

#import "pythagorasTests.h"
#import "NumbersDescription.h"


@implementation pythagorasTests

- (void)setUp
{
  [super setUp];
    
  // Set-up code here.
}

- (void)tearDown
{
  // Tear-down code here.
  
  [super tearDown];
  [NSThread sleepForTimeInterval:1.0];
}

- (void)testBasic
{
  NumbersDescription *d = [[NumbersDescription alloc] initForName: @"vojta" lastName: @"jina"];
  
  STAssertEquals(d.personal, (NSUInteger)3, @"4+6+1+2+1+1+9+5+1=3+0=3");
  STAssertEquals(d.action, (NSUInteger)5, @"4+6+1+2+1=1+4=5");
  STAssertEquals(d.heritage, (NSUInteger)7, @"1+9+5+1=1+6=7");
  STAssertEquals(d.internal, (NSUInteger)8, @"6+1+9+1=1+7=8");
  STAssertEquals(d.external, (NSUInteger)4, @"4+1+2+1+5=1+3=4");
  STAssertEquals(d.faith, (NSUInteger)3, @"1+2=3");
}

- (void)testRegression {
  NumbersDescription *d = [[NumbersDescription alloc] initForName: @"ewa" lastName: @"farna"];
  
  STAssertEquals(d.action, (NSUInteger)11, @"ewa farna");
}

- (void)testSpecialCharacters {
  NumbersDescription *d = [[NumbersDescription alloc] initForName: @"Vojtěch" lastName: @"Jína"];
  
  // 4+6+1+2+1=1+4
  STAssertEquals(d.action, (NSUInteger)11, @"basic computation");
}

- (void)testCharToNumber {
  NumbersDescription *d = [[NumbersDescription alloc] initForName: @"" lastName: @""];

  STAssertEquals([d charValue: 'a'], (NSUInteger)1, @"a = 1");
  STAssertEquals([d charValue: 'b'], (NSUInteger)2, @"b = 2");
  STAssertEquals([d charValue: 'i'], (NSUInteger)9, @"i = 9");
  STAssertEquals([d charValue: 'j'], (NSUInteger)1, @"j = 1");
  STAssertEquals([d charValue: 's'], (NSUInteger)1, @"s = 1");
}


- (void)testIsVowel {
  NumbersDescription *d = [[NumbersDescription alloc] initForName: @"" lastName: @""];

  STAssertTrue([d isVowel: 'a'], @"");
  STAssertFalse([d isVowel: 'b'], @"");
  STAssertFalse([d isVowel: 'c'], @"");
  STAssertFalse([d isVowel: 'd'], @"");
  STAssertTrue([d isVowel: 'e'], @"");
}

- (void)testSum {
  NumbersDescription *d = [[NumbersDescription alloc] initForName: @"" lastName: @""];
  
  STAssertEquals([d sum:12], (NSUInteger)3, @"sum numbers 1+2");
  STAssertEquals([d sum:78], (NSUInteger)6, @"sum 7+8=1+5");
  STAssertEquals([d sum:56], (NSUInteger)11, @"11 is special");
  STAssertEquals([d sum:994], (NSUInteger)22, @"22 is special");
  
}

@end
