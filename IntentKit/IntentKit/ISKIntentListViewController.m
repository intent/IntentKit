//
//  ISKIntentListViewController.m
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import "ISKIntentListViewController.h"
#import "IntentKit.h"
#import "ISKIntentManager.h"

@interface ISKIntentListViewController () {
	ISKIntent *_intent;
	NSArray *_apps;
}

@end

@implementation ISKIntentListViewController

@synthesize delegate = _delegate;

- (id)initWithIntent:(ISKIntent *)intent
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
		_intent = intent;
		_apps = [NSArray arrayWithObject:[NSDictionary dictionaryWithObjectsAndKeys:
										  @"My Prayer Pal",@"name",
										  @"Add a prayer to your prayer list",@"description"
										  , nil]];
		//[[ISKIntentManager sharedIntentManager] installedAppsForIntent:intent];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self setTitle:NSLocalizedString(@"Intents",nil)];
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    return [_apps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary *app = [_apps objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"ISKAppCell";
    UITableViewCell *cell;
    
	if( !(cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]) ){
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
									  reuseIdentifier:CellIdentifier];
	}
    
	[[cell textLabel] setText:[app objectForKey:@"name"]];
	
	[[cell detailTextLabel] setText:[app objectForKey:@"description"]];
	
	
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary *app = [_apps objectAtIndex:indexPath.row];
	
	[self.delegate intentListViewController:self didSelectApp:app];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mypraypal://features/prayers;add?description=Example&category=Friends&status=Open"]];
}

@end
