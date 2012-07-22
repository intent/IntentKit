//
//  ISKIntentManager.h
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IntentKit.h"

@class ISKIntent;

@interface ISKIntentManager(Private)

- (NSArray *)installedAppsForIntent:(ISKIntent *)intent;

- (void)setPerferredApp:(NSDictionary *)dictionary forType:(NSString *)type;

- (NSDictionary *)preferredAppForType:(NSString *)type;

+ (NSURL *)URLForApp:(NSDictionary *)app withIntent:(ISKIntent *)intent;

@end