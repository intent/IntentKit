//
//  TestDudeViewController.h
//  DudeSocial
//
//  Created by Zac Bowling on 7/22/12.
//  Copyright (c) 2012 TestDude. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestDudeViewController : UIViewController


@property (strong, nonatomic) NSString *callbackURL;

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)doPost:(id)sender;

@end
