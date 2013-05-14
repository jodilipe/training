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
-(void) handleTwitterData: (NSData*) data
              urlResponse: (NSHTTPURLResponse*) urlResponse
                    error: (NSError*) error;
@property (nonatomic, strong) IBOutlet UITextView *twitterTextView;
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

-(void) reloadTweets {
    NSURL *twitterAPIURL = [NSURL URLWithString:
                            @"http://api.twitter.com/1/statuses/user_timeline.json"];
    NSDictionary *twitterParams = @ {
        @"screen_name" : @"jodilipe",
//        @"screen_name" : @"pragprog",
    };
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                            requestMethod:SLRequestMethodGET
                                                      URL:twitterAPIURL
                                               parameters:twitterParams];
    
    [request performRequestWithHandler:^(NSData *responseData,
                                         NSHTTPURLResponse *urlResponse,
                                         NSError *error) {
        [self handleTwitterData:responseData
                    urlResponse:urlResponse
                          error:error]; 
    }];  
}

-(void) handleTwitterData: (NSData*) data
              urlResponse: (NSHTTPURLResponse*) urlResponse
                    error: (NSError*) error {
    NSError *jsonError = nil;
    NSJSONSerialization *jsonResponse =
    [NSJSONSerialization JSONObjectWithData:data
                                    options:0
                                      error:&jsonError];
    if (!jsonError &&
        [jsonResponse isKindOfClass:[NSArray class]]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSArray *tweets = (NSArray*) jsonResponse;
            tweets = [tweets sortedArrayUsingComparator:
                      ^NSComparisonResult(id obj1, id obj2) {
                          NSString *tweet1 = [obj1 valueForKey:@"text"];
                          NSString *tweet2 = [obj2 valueForKey:@"text"];
                          return [tweet1 compare:tweet2];
                      }];
            for (NSDictionary *tweetDict in tweets) {
                NSString *tweetText =
                [NSString stringWithFormat:@"%@ (%@)",
                 [tweetDict valueForKey:@"text"],
                 [tweetDict valueForKey:@"created_at"]];
                self.twitterTextView.text = [NSString stringWithFormat:@"%@%@\n\n",
                                             self.twitterTextView.text,
                                             tweetText];
            }
        });
    }
}
@end
