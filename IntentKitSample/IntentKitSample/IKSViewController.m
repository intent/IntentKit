//
//  IKSViewController.m
//  IntentKitSample
//
//  Created by Jonathan Dalrymple on 21/07/2012.
//  Copyright (c) 2012 Intent. All rights reserved.
//

#import "IKSViewController.h"
#import "IntentKit.h"

@interface IKSViewController ()

@end

@implementation IKSViewController

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)showPicker:(id)sender {
	
	ISKIntentPickerViewController *picker = [[ISKIntentPickerViewController alloc] initWithIntent:nil];
	
	[picker setDelegate:self];
	
	[self presentViewController:picker
					   animated:YES
					 completion:nil];
	
}

@end
