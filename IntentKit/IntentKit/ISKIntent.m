//
//  ISKIntent.m
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 i'mhello. All rights reserved.
//

#import "ISKIntent.h"
#import "IntentKit.h"

@implementation ISKIntent
@synthesize type=_type;
@synthesize parameters=_parameters;


-(id)initWithType:(NSString *)type parameters:(NSDictionary *)parameters {
	self = [super init];
	if (self){
		_type = [type copy];
		_parameters = [parameters copy];
	}
	return self;
}

@end
