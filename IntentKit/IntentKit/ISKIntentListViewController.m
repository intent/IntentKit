//
//  ISKIntentListViewController.m
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import "ISKIntentListViewController.h"
#import "ISKIntentManager.h"

@interface ISKIntentListViewController () {
	ISKIntent	*_intent;
	NSArray		*_collection;
}

-(NSArray*) collection;
-(ISKIntent*) intent;

@end

@implementation ISKIntentListViewController

@synthesize delegate = _delegate;

- (id)initWithIntent:(ISKIntent *)intent
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
		_intent = intent;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
																  style:UIBarButtonItemStyleDone
																 target:self
																 action:@selector(didSelectCancel:)];
	
	[[self navigationItem] setRightBarButtonItem:cancelBtn];
	
	[self setTitle:NSLocalizedString(@"Intents",nil)];
	
	
	;
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - actions
-(void) didSelectCancel:(id) sender{
	
	[self  dismissViewControllerAnimated:YES
							  completion:nil];
	
}

-(void) didSelectIntent:(ISKIntent*) aIntent{
	if( [[[self navigationController] delegate] respondsToSelector:@selector(intentPickerViewController:didSelectToOpenIntent:withURL:)] ){
		
		[[(ISKIntentPickerViewController*)[self navigationController] delegate] intentPickerViewController:(ISKIntentPickerViewController*)[self navigationController]
																					 didSelectToOpenIntent:aIntent
																								   withURL:nil];
		
	}
}

-(NSArray*) collection{
	
	if( !_collection ){
		_collection = [[ISKIntentManager sharedIntentManager] installedAppsForIntent:[self intent]];
	}
	
	return _collection;
}

-(ISKIntent*) intent{
	return _intent;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self collection] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
	if( !(cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]) ){
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
									  reuseIdentifier:CellIdentifier];
	}
    
	[[cell textLabel] setText:@"Application"];
	
	[[cell detailTextLabel] setText:@"Action Description"];
	
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	[self didSelectIntent:[[self collection] objectAtIndex:[indexPath row]]];
	
}

@end
