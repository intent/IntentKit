//
//  IntentKit.h
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 i'mhello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ISKIntent : NSObject 

-(id)initWithType:(NSString *)type parameters:(NSDictionary *)parameters;

@property (readonly,nonatomic) NSString *type;
@property (readonly,nonatomic) NSDictionary *parameters;

@end


@interface ISKIntentManager : NSObject

+(ISKIntentManager *)sharedIntentManager;

-(void)startIntentManager;

-(void)stopIntentManager;

-(NSURL *)defaultURLForIntent:(ISKIntent *)intent;

@end


@class ISKIntentViewController;

@protocol ISKIntentViewControllerDelegate <NSObject>

-(void)intentViewController:(ISKIntentViewController *)controller didSelectToOpenIntent:(ISKIntent *)intent withURL:(NSURL *)url;

@end

@interface ISKIntentViewController : UIViewController

-(id)initWithIntent:(ISKIntent *)intent;

@property (assign,nonatomic) id<ISKIntentViewControllerDelegate> delegate;

@end

