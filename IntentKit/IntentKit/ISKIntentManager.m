//
//  ISKIntentManager.m
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import "ISKIntentManager.h"
#import "IntentKit.h"

@interface ISKIntentManager () {
	NSString *_cachePath;
}

@end

@implementation ISKIntentManager 

+(ISKIntentManager *)sharedIntentManager {
	static ISKIntentManager *sharedInstanceManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstanceManager = [[self alloc] init];
	});
	return sharedInstanceManager;
}

-(id) init {
	self = [super init];
	if(self) {
		
	}
	return self;
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

- (NSArray *)installedAppsForIntent:(ISKIntent *)intent {
	return [NSArray array];
}

- (void)setPerferredApp:(NSDictionary *)dictionary forType:(NSString *)type {
	//
}

- (NSDictionary *)preferredAppForType:(NSString *)type {
	return nil;
}


@end
