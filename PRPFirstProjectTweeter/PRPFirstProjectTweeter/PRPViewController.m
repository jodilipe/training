//
//  PRPViewController.m
//  PRPFirstProjectTweeter
//
//  Created by Jon Pedersen on 12/05/13.
//  Copyright (c) 2013 jApps. All rights reserved.
//

#import "PRPViewController.h"
#import <Social/Social.h>

@interface PRPViewController ()
-(void) reloadTweets;
@property (nonatomic, strong) IBOutlet UIWebView *twitterWebView;
@end

@implementation PRPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) handleTweetButtonTapped: (id) sender {
    if ([SLComposeViewController isAvailableForServiceType: SLServiceTypeTwitter]) {
        SLComposeViewController *tweetVC =
        [SLComposeViewController composeViewControllerForServiceType:
         SLServiceTypeTwitter];
        [tweetVC setInitialText: NSLocalizedString (
                                                    @"I just finished the first project in iOS SDK Development. #pragsios",
                                                    nil)];
        tweetVC.completionHandler = ^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultDone) {
                [self dismissViewControllerAnimated:YES completion:NULL];
                [self reloadTweets];  
            }
        };
        [self presentViewController:tweetVC animated:YES completion:NULL];
    }
}

-(IBAction) handleShowMyTweetsTapped: (id) sender
{
    [self reloadTweets];
}

-(void) reloadTweets
{
    [self.twitterWebView loadRequest:
     [NSURLRequest requestWithURL:
      //      [NSURL URLWithString:@"http://stream.jonlind.dk"]]];
      [NSURL URLWithString:@"http://www.twitter.com/jodilipe"]]];
    //    [NSURL URLWithString:@"http://www.twitter.com/pragprog"]]];
}

@end
