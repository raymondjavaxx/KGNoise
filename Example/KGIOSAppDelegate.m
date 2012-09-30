//
//  KGIOSAppDelegate.m
//  KGNoiseEample
//
//  Created by David Keegan on 9/11/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "KGIOSAppDelegate.h"
#import "KGNoise.h"
#import "UIImage+KGNoise.h"

@implementation KGIOSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[UIViewController alloc] init];

    KGNoiseView *noiseView = [[KGNoiseView alloc] initWithFrame:self.window.rootViewController.view.bounds];
    noiseView.backgroundColor = [UIColor colorWithRed:0.118 green:0.501 blue:0.983 alpha:1.000];
    noiseView.noiseBlendMode = kCGBlendModeMultiply;
    noiseView.noiseOpacity = 0.1;
    [self.window.rootViewController.view addSubview:noiseView];

    UIImage *image = [UIImage imageNamed:@"Perspective-Button-Go-icon"];
    CGRect buttonFrame = CGRectZero;
    buttonFrame.size = image.size;
    buttonFrame.origin.x = round(CGRectGetMidX(noiseView.bounds)-CGRectGetMidX(buttonFrame));
    buttonFrame.origin.y = round(CGRectGetMidY(noiseView.bounds)-CGRectGetMidY(buttonFrame));
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button setImage:[image imageWithNoiseOpacity:0.5] forState:UIControlStateNormal];
    [noiseView addSubview:button];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
