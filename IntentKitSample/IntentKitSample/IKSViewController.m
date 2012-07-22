//
//  IKSViewController.m
//  IntentKitSample
//
//  Created by Jonathan Dalrymple on 21/07/2012.
//  Copyright (c) 2012 Intent. All rights reserved.
//

#import "IKSViewController.h"


@interface IKSViewController () {
	ISKIntentPickerViewController *picker;
}

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
	NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"my awesome data",@"message",nil];
	ISKIntent* intent = [[ISKIntent alloc] initWithType:@"share" parameters:dictionary];
	
	NSURL *url = [[ISKIntentManager sharedIntentManager] defaultURLForIntent:intent];
	if (!url) {
		picker = [[ISKIntentPickerViewController alloc] initWithIntent:intent];
		
		[picker setDelegate:self];
		
		[self presentViewController:picker
						   animated:YES
						 completion:nil];
	}
	else {
		[[UIApplication sharedApplication] openURL:url];
	}
	
}

-(void)intentPickerViewController:(ISKIntentPickerViewController *)controller didSelectToOpenIntent:(ISKIntent *)intent withURL:(NSURL *)url{
	
	[controller dismissViewControllerAnimated:YES
								   completion:nil];
	picker = nil;
	
	[[UIApplication sharedApplication] openURL:url];
}

-(void)intentPickerViewControllerDidCancel:(ISKIntentPickerViewController *)controller {
	[controller dismissViewControllerAnimated:YES
								   completion:nil];
	picker = nil;
}

@end
