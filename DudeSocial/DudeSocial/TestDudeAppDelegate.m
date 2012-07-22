//
//  TestDudeAppDelegate.m
//  DudeSocial
//
//  Created by Zac Bowling on 7/22/12.
//  Copyright (c) 2012 TestDude. All rights reserved.
//

#import "TestDudeAppDelegate.h"

#import "TestDudeViewController.h"

@implementation TestDudeAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	self.viewController = [[TestDudeViewController alloc] initWithNibName:@"TestDudeViewController" bundle:nil];
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
	
	NSArray *comp1 = [[url absoluteString] componentsSeparatedByString:@"?"];
	NSString *query = [comp1 lastObject];
	NSArray *queryElements = [query componentsSeparatedByString:@"&"];
	for (NSString *element in queryElements) {
		NSArray *keyVal = [element componentsSeparatedByString:@"="];
		if (keyVal.count > 0) {
			NSString *variableKey = [keyVal objectAtIndex:0];
			NSString *value = (keyVal.count == 2) ? [keyVal lastObject] : nil;
			if ([variableKey isEqualToString:@"x-success"])
			{
				self.viewController.callbackURL = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
			}
			else {
				self.viewController.textView.text = [variableKey isEqualToString:@"text"];
			}
		}
	}
	
	return YES;
}

@end
