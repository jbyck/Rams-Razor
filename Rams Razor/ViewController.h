//
//  ViewController.h
//  Rams Razor
//
//  Created by Barry Lachapelle on 2013-09-08.
//  Copyright (c) 2013 Barry Lachapelle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>
#import <Social/Social.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate> {

    IBOutlet UIImageView *imageView;
    IBOutlet UIImageView *AnimationView;
    IBOutlet AVAudioPlayer *audioPlayer;
    IBOutlet AVAudioPlayer *audioPlayer2;
    IBOutlet AVAudioPlayer *audioPlayer3;

    CMMotionManager *motionManager;
	NSTimer *timer;
	float rotation;
	
}

-(IBAction)playrazor;

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
