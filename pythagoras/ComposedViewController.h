//
//  ComposedViewController.h
//  pythagoras
//
//  Created by Vojta Jína on 4/13/13.
//  Copyright (c) 2013 Vojta Jína. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumbersFormatter.h"

@interface ComposedViewController : UIViewController

@property(nonatomic, strong) NumbersFormatter *formatter;

- (IBAction)updateNumbers;

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField;
  
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
