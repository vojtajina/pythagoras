//
//  ComposedViewController.m
//  pythagoras
//
//  Created by Vojta Jína on 4/13/13.
//  Copyright (c) 2013 Vojta Jína. All rights reserved.
//

#import "ComposedViewController.h"
#import "NumbersDescription.h"

@interface ComposedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITableView *numbersTable;

@end

@implementation ComposedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }

  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
  [theTextField resignFirstResponder];
  [self updateNumbers];
  return YES;
}


- (IBAction)updateNumbers {
  _description = [[NumbersDescription alloc] initForName: _firstNameField.text lastName: _lastNameField.text];
  [_numbersTable reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  if (_description == nil) {
    return 0;
  }
  
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _description.titles.count;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [NSString stringWithFormat:@"Numbers for %@ %@", _description.first, _description.last];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
  }
  
  cell.textLabel.text = [_description.titles objectAtIndex:indexPath.row];
  cell.detailTextLabel.text = [_description.descriptions objectAtIndex:indexPath.row];
  
  return cell;
}


@end
