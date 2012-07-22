//
//  ISKIntentPickerViewController.m
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import "ISKIntentPickerViewController.h"
#import "ISKIntentListViewController.h"
#import "IntentKit.h"
#import "ISKIntentManager.h"

extern const unsigned long ISKNavBarPng2x_size;
extern const unsigned char ISKNavBarPng2x[];
extern const unsigned long ISKNavBarPng_size;
extern const unsigned char ISKNavBarPng[];

@interface ISKIntentPickerViewController () {
	ISKIntent *_intent;
	ISKIntentListViewController *_listViewController;
}

@end

@implementation ISKIntentPickerViewController 

@dynamic delegate;

- (id)initWithIntent:(ISKIntent *)intent
{
	ISKIntentListViewController *intentListViewController = [[ISKIntentListViewController alloc] initWithIntent:intent];
	
    self = [super initWithRootViewController:intentListViewController];
    if (self) {
        _intent = intent;
		_listViewController = intentListViewController;
		_listViewController.delegate = self;
		_listViewController.navigationItem.leftBarButtonItem =
			[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
														  target:self
														  action:@selector(doCancel:)];
		
		UIImage *navBackground = nil;
		
		if ([[UIScreen mainScreen] scale] == 1.0) {
			navBackground = [UIImage imageWithData:[NSData dataWithBytes:ISKNavBarPng length:ISKNavBarPng_size]];
		}
		else {
			navBackground = [UIImage imageWithData:[NSData dataWithBytes:ISKNavBarPng2x length:ISKNavBarPng2x_size]];
			navBackground = [UIImage imageWithCGImage:navBackground.CGImage scale:2 orientation:UIImageOrientationUp];
		}
		
		[self.navigationBar setTintColor:[UIColor colorWithRed:95/255.0f green:100/255.0f blue:130/255.0f alpha:1.0]];
		[self.navigationBar setBackgroundImage:navBackground forBarMetrics:UIBarMetricsDefault];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)intentListViewController:(ISKIntentListViewController *)controller didSelectApp:(NSDictionary *)app 
{
	NSURL *url = [ISKIntentManager URLForApp:app withIntent:_intent];
	
	[self.delegate intentPickerViewController:self didSelectToOpenIntent:_intent withURL:url];
}

-(void)doCancel:(id)sender 
{
	[self.delegate intentPickerViewControllerDidCancel:self];
}

@end


