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

- (void)setPerferedApp:(NSDictionary *)dictionary forType:(NSString *)type;

- (NSDictionary *)preferedAppForType:(NSString *)type;

@end