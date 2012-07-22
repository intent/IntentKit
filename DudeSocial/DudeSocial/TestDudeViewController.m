//
//  TestDudeViewController.m
//  DudeSocial
//
//  Created by Zac Bowling on 7/22/12.
//  Copyright (c) 2012 TestDude. All rights reserved.
//

#import "TestDudeViewController.h"

@interface TestDudeViewController ()

@end

@implementation TestDudeViewController
@synthesize textView;
@synthesize callbackURL;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doPost:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:callbackURL]];
}
@end
