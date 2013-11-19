//
//  aboutController.m
//  Rams Razor
//
//  Created by Barry Lachapelle on 2013-09-15.
//
//

#import "aboutController.h"

@interface aboutController ()

@end

@implementation aboutController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(IBAction)postFacebook:(id)sender{
    
    NSString *post = [[NSString alloc] initWithFormat:@"Rams Razor is a free app that let's you relive how your Dad shaved in the 70's."];
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/rams-razor/id706675902?ls=1&mt=8"];
    
    SLComposeViewController *facebookSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebookSheet setInitialText:post];
    [facebookSheet addURL:url];
    [self presentViewController:facebookSheet animated:YES completion:nil];
    
    SLComposeViewControllerCompletionHandler completion = ^(SLComposeViewControllerResult result){
        
        switch(result){
            
            case SLComposeViewControllerResultDone:
            NSLog(@"posted to Facebook");
            break;
                
            case SLComposeViewControllerResultCancelled:
            NSLog(@"User cancelled post to Facebook");
                
            default: break;
                
    }
        
    [facebookSheet dismissViewControllerAnimated:YES completion:nil];
        
    };
    
    facebookSheet.completionHandler = completion;
    
}



-(IBAction)postTwitter:(id)sender{
    
    NSString *post = [[NSString alloc] initWithFormat:@"#RamsRazor is a free app that let's you relive how your Dad shaved in the 70's."];
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/rams-razor/id706675902?ls=1&mt=8"];
    
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetSheet setInitialText:post];
    [tweetSheet addURL:url];
    [self presentViewController:tweetSheet animated:YES completion:nil];
    
    SLComposeViewControllerCompletionHandler completion = ^(SLComposeViewControllerResult result){
        
        switch(result){
                
            case SLComposeViewControllerResultDone:
                NSLog(@"posted to Twitter");
                break;
                
            case SLComposeViewControllerResultCancelled:
                NSLog(@"User cancelled post to Facebook");
                
            default: break;
                
        }
        
        [tweetSheet dismissViewControllerAnimated:YES completion:nil];
        
    };
    
    tweetSheet.completionHandler = completion;

    
}

-(IBAction)openSite {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.barrylachapelle.com?=rams"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // resize elements according to screen size
    int screen_h = self.view.frame.size.height;
    int screen_w = self.view.frame.size.width;
    
    //set background to screen height
    self.razorFrame.frame = CGRectMake(0, 0, screen_w, screen_h);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}



@end
