//
//  ISKIntentManager.m
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import "ISKIntentManager.h"
#import "IntentKit.h"

@implementation ISKIntentManager {
	
}

+(ISKIntentManager *)sharedIntentManager {
	static ISKIntentManager *sharedInstanceManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstanceManager = [[self alloc] init];
	});
	return sharedInstanceManager;
}

-(void)startIntentManager {
	
}

-(void)stopIntentManager {
	
}

-(NSURL *)defaultURLForIntent:(ISKIntent *)intent {
	//checks preferences to see if the intent type has a registered default handler for an app 
	//and if it's still installed. 
	
	return nil;
}

@end
