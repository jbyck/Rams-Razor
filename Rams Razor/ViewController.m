//
//  ViewController.m
//  Rams Razor
//
//  Created by Barry Lachapelle on 2013-09-08.
//  Copyright (c) 2013 The Blimp Factory. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController;

-(IBAction)playrazor;
{
    
    if (audioPlayer.playing) {
        
        //play click
        NSURL *url2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/click2.wav", [[NSBundle mainBundle] resourcePath]]];
        NSError *error2;
        audioPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:&error2];
        audioPlayer2.numberOfLoops = 1;
        [audioPlayer2 setVolume: 0.5];
        [audioPlayer2 play];
        
        //stop buzz
        [audioPlayer stop];
        
        //kill cuthair
        [audioPlayer3 stop];
        
        //animate button down
        CGRect buttonTop = self.button.frame;
        buttonTop.origin.y = 98;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.button.frame = buttonTop;
        [UIView commitAnimations];

        
    }   else {
       
        //play click
        NSURL *url2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/click2.wav", [[NSBundle mainBundle] resourcePath]]];
        NSError *error2;
        audioPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:&error2];
        audioPlayer2.numberOfLoops = 1;
        [audioPlayer2 setVolume: 0.5];
        [audioPlayer2 play];
        
        //play buzz
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/buzz1a.wav", [[NSBundle mainBundle] resourcePath]]];
        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        audioPlayer.numberOfLoops = -1;
        [audioPlayer setVolume: 0.2];
        [audioPlayer play];
        
        //animate button up
        CGRect buttonTop = self.button.frame;
        buttonTop.origin.y = 70;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.button.frame = buttonTop;
        [UIView commitAnimations];
        
        //activate motion and call cuthair
        motionManager = [[CMMotionManager alloc] init];
        motionManager.deviceMotionUpdateInterval = 1.0/60.0; //60 Hz
        [motionManager startDeviceMotionUpdates];
        timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/5.0) target:self selector:@selector(cuthair) userInfo:nil repeats:YES];
        
    }
    
}


#define degrees(x) (180.0 * x / M_PI)

-(void)cuthair;
{
    
    
        if (audioPlayer.playing) {
            
        CMAttitude *attitude;
        CMDeviceMotion *motion = motionManager.deviceMotion;
        attitude = motion.attitude;

        // check for angle and play haricutting
        if(degrees(attitude.pitch)){
            if(degrees(attitude.pitch) < 50){
                
                
            //NSLog(@"z : %g", acceleration.z);
        
        //play haircutting audio
        if(!audioPlayer3.playing){
            NSURL *url3 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/hair.wav", [[NSBundle mainBundle] resourcePath]]];
            NSError *error3;
            audioPlayer3 = [[AVAudioPlayer alloc] initWithContentsOfURL:url3 error:&error3];
            audioPlayer3.numberOfLoops = 1;
            [audioPlayer3 setVolume: 0.5];
            [audioPlayer3 play];
        }
        
        //vibrate
//        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
//        NSMutableArray* arr = [NSMutableArray array ];
//        [arr addObject:[NSNumber numberWithBool:YES]];
//        [arr addObject:[NSNumber numberWithInt:200]];
//        [dict setObject:arr forKey:@"VibePattern"];
//        [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
//        AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);
                
                
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        
        }else{

        //kill haircuttin audio
        [audioPlayer3 stop];

        }}}
    
}




-(IBAction)infobutton;

{

    if (audioPlayer.playing) {
        
        //turns off razor before going to info modal
        
        //play click
        NSURL *url2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/click2.wav", [[NSBundle mainBundle] resourcePath]]];
        NSError *error2;
        audioPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:&error2];
        audioPlayer2.numberOfLoops = 1;
        [audioPlayer2 setVolume: 0.5];
        [audioPlayer2 play];
        
        //stop buzz
        [audioPlayer stop];
        
        //kill haircuttin audio
        [audioPlayer3 stop];
        
        //animate button down
        CGRect buttonTop = self.button.frame;
        buttonTop.origin.y = 98;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.button.frame = buttonTop;
        [UIView commitAnimations];
        
        //kill cuthair
        [motionManager stopGyroUpdates];
        [timer invalidate];
        
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];

    // resize elements according to screen size
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    int screen_h = self.view.frame.size.height;
    int screen_w = self.view.frame.size.width;
    
    //set background to screen height
    self.imageView.frame = CGRectMake(0, 0, screen_w, screen_h);
    
    
    if (screenBounds.size.height == 568) {
        
        //set button size
        self.button.frame = CGRectMake(62, 98, 197, 223);
        
    }
    

    else {
        
        //set button size
        self.button.frame = CGRectMake(62, 95, 197, 175);
        
    }
    

    //start motion manager
    motionManager = [[CMMotionManager alloc] init];

    //opening sequence animation
    AnimationView.animationImages = [NSArray arrayWithObjects:
                                     
                                     [UIImage imageNamed:@"01.png"],
                                     [UIImage imageNamed:@"02.png"],
                                     [UIImage imageNamed:@"03.png"],
                                     [UIImage imageNamed:@"04.png"],
                                     [UIImage imageNamed:@"05.png"],
                                     [UIImage imageNamed:@"06.png"],
                                     [UIImage imageNamed:@"07.png"],
                                     [UIImage imageNamed:@"08.png"],
                                     [UIImage imageNamed:@"09.png"],
                                     [UIImage imageNamed:@"10.png"],
                                     [UIImage imageNamed:@"11.png"],
                                     [UIImage imageNamed:@"12.png"],
                                     [UIImage imageNamed:@"13.png"],
                                     [UIImage imageNamed:@"14.png"],
                                     [UIImage imageNamed:@"15.png"],
                                     [UIImage imageNamed:@"16.png"],
                                     [UIImage imageNamed:@"17.png"],
                                     [UIImage imageNamed:@"18.png"],
                                     [UIImage imageNamed:@"19.png"],
                                     [UIImage imageNamed:@"20.png"],
                                     [UIImage imageNamed:@"21.png"],
                                     [UIImage imageNamed:@"22.png"],
                                     [UIImage imageNamed:@"23.png"],
                                     [UIImage imageNamed:@"24.png"],
                                     [UIImage imageNamed:@"25.png"],
                                     [UIImage imageNamed:@"26.png"],
                                     [UIImage imageNamed:@"27.png"],
                                     [UIImage imageNamed:@"28.png"],
                                     [UIImage imageNamed:@"29.png"], nil];
    
    [AnimationView setAnimationRepeatCount:1];
    AnimationView.animationDuration = 1;
    [AnimationView startAnimating];
    
    [self performSelector:@selector(fadeopeningsequence) withObject:nil afterDelay:1.7];
    
}




-(void)fadeopeningsequence{
    
    //dump opening sequence once it's done playing
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    [AnimationView setAlpha:0];
    [UIView commitAnimations];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end



//stuff


//    //acceleromoter
//    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
//    accel.delegate = self;
//    accel.updateInterval = 1.0f / 20.0f;
//    [super viewDidLoad];



//-(void)accelerometer:(UIAccelerometer *)accelerometer
//       didAccelerate:(UIAcceleration *)acceleration{
//    function get accelromoter speeds
//    NSLog(@"z : %g", acceleration.z);
//
//}



//    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
//    NSMutableArray* arr = [NSMutableArray array ];
//
//    [arr addObject:[NSNumber numberWithBool:YES]]; //vibrate for 2000ms
//    [arr addObject:[NSNumber numberWithInt:2000]];
//
//    [arr addObject:[NSNumber numberWithBool:NO]];  //stop for 1000ms
//    [arr addObject:[NSNumber numberWithInt:1000]];
//
//    [arr addObject:[NSNumber numberWithBool:YES]];  //vibrate for 1000ms
//    [arr addObject:[NSNumber numberWithInt:1000]];
//
//    [arr addObject:[NSNumber numberWithBool:NO]];    //stop for 500ms
//    [arr addObject:[NSNumber numberWithInt:500]];
//
//    [dict setObject:arr forKey:@"VibePattern"];
//    [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
//
//    AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);
















