//
//  ViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 11.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ViewController.h"
#import "SignInViewController.h"
#import "MyRectGradientView.h"
#import "Colours.h"

@implementation ViewController {
    NSImageView *imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackgroundImage:@"background_main"];
    NSClickGestureRecognizer *continueClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(continueClicked:)];
    [self.continueButton addGestureRecognizer:continueClick];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (void)continueClicked:(id)sender
{
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    SignInViewController *vc1 = (SignInViewController*)[sb instantiateControllerWithIdentifier:@"SignInViewController"];
    self.view.window.contentViewController = vc1;
}

-(void)setBackgroundImage : (NSString *) imageName {
    if(imageView == nil) {
        imageView = [[NSImageView alloc] initWithFrame:self.view.frame];
        [imageView setImageScaling:NSImageScaleAxesIndependently];
        [imageView setImageAlignment:NSImageAlignCenter];
        [imageView setImage:[NSImage imageNamed:imageName]];
        [imageView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        
        [self.view addSubview:imageView positioned:NSWindowBelow relativeTo:self.view];
        
        NSDictionary * views = NSDictionaryOfVariableBindings(imageView);
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];
    }
    
}

@end
