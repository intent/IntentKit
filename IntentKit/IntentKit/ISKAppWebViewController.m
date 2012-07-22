//
//  ISKAppWebViewController.m
//  IntentKit
//
//  Created by Doug Mason on 7/22/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import "ISKAppWebViewController.h"

@interface ISKAppWebViewController ()

@end

@implementation ISKAppWebViewController
@synthesize webView = _webView;
-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:[[self view] bounds]];
    }
    return _webView;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] addSubview:[self webView]];
//    NSURLRequest *request = [NSURLRequest requestWithURL;
//    [[self webView] loadRequest:request];
    NSString* htmlString = @"<!DOCTYPE html><html><head><title>Apps</title></head><body><div><div><div><table><tr><th>Name</th><th>Description</th><th>URL Prefix</th><th>Intents</th></tr><tr><td>Chrome</td><td>Web Browser</td><td>chrome://</td><td><ul><li>action-browse</li></ul></td></tr><tr><td>Twitter</td><td>Twitter Client</td><td>twitter://</td><td><ul><li>action-tweet</li></ul></td></tr><tr><td>Evernote</td><td>Editor</td><td>evernote://</td><td><ul><li>action-edit</li></ul></td></tr><tr><td>Wikipedia</td><td>reference</td><td>wiki://</td><td><ul><li>action-research</li></ul></td></tr></table></div> <!-- /container --></body></html>";
    [self.webView loadHTMLString:htmlString baseURL:nil];
       // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
