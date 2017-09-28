//
//  SignInViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SignInViewController.h"
#import "Colours.h"
#import "MainTabViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.secondView.hidden = YES;
    self.passphareView.hidden = YES;
    self.firstView.hidden = NO;

    NSClickGestureRecognizer *registerClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(RegisterAction:)];
    [self.RegisterLabel addGestureRecognizer:registerClick];
    
    NSClickGestureRecognizer *signInClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(SignInAction:)];
    [self.SignInLabel addGestureRecognizer:signInClick];
    
    NSClickGestureRecognizer *privateKeyClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(privateKeyAction:)];
    [self.privateKeyButton addGestureRecognizer:privateKeyClick];
    
    NSClickGestureRecognizer *signInButtonClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(signInButtonAction:)];
    [self.SignInButton addGestureRecognizer:signInButtonClick];
    
    self.passphareView.delegate = self;
}

- (void)signInButtonAction:(id)sender
{
    //MainTabViewController
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    MainTabViewController *vc = (MainTabViewController *)[sb instantiateControllerWithIdentifier:@"MainTabViewController"];
    self.view.window.contentViewController = vc;
}

- (void)RegisterAction:(id)sender
{
    self.RegisterLabel.textColor = [NSColor whiteColor];
    self.SignInLabel.textColor = [NSColor colorFromHexString:@"959AA2"];
//    self.firstView.animator.alphaValue = 0;
//    self.secondView.animator.alphaValue = 1;
    self.firstView.hidden = YES;
    self.secondView.hidden = NO;
}

- (void)SignInAction:(id)sender
{
    self.SignInLabel.textColor = [NSColor whiteColor];
    self.RegisterLabel.textColor = [NSColor colorFromHexString:@"959AA2"];
    
//    self.firstView.animator.alphaValue = 1;
//    self.secondView.animator.alphaValue = 0;
    self.firstView.hidden = NO;
    self.secondView.hidden = YES;
}

- (void)privateKeyAction:(id)sender
{
    self.firstView.hidden = YES;
    self.secondView.hidden = YES;
    self.passphareView.hidden = NO;
}

//-(void)fadeInOutAnimation : (NSView *) view1 : (NSView *) view2 {
//    //duration doesn't work
//    [NSAnimationContext beginGrouping];
//    [[NSAnimationContext currentContext] setDuration:2.0];
//    [[view1 animator] setAlphaValue:0.0f];
//    [NSAnimationContext endGrouping];
//    
//    [NSAnimationContext beginGrouping];
//    [[NSAnimationContext currentContext] setDuration:2.0];
//    [[view2 animator] setAlphaValue:1.0f];
//    [NSAnimationContext endGrouping];
//}

-(void)passphraseViewDismiss {
//    self.passphareView.animator.alphaValue = 0;
    self.passphareView.hidden = YES;
//    self.secondView.animator.alphaValue = 1;
    self.secondView.hidden = NO;
    self.firstView.hidden = YES;
}

@end
