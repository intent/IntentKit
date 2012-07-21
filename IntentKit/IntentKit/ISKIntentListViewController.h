//
//  ISKIntentListViewController.h
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ISKIntentListViewController;
@protocol ISKIntentListViewControllerDelegate <NSObject>

-(void)intentListViewController:(ISKIntentListViewController *)controller didSelectApp:(NSDictionary *)dictionary;

@end

@class ISKIntent;

@interface ISKIntentListViewController : UITableViewController

- (id)initWithIntent:(ISKIntent *)intent;

@property (assign,nonatomic) id<ISKIntentListViewControllerDelegate> delegate;

@end
