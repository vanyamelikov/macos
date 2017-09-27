//
//  SignInViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SignInViewController.h"
#import "Colours.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSWindow *window = [[NSApplication sharedApplication] mainWindow];
    [window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"Background"]]];

    self.secondView.alphaValue = YES;
    self.passphareView.hidden = YES;
    self.passphareView.alphaValue = 0.0f;

    NSClickGestureRecognizer *registerClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(RegisterAction:)];
    [self.RegisterLabel addGestureRecognizer:registerClick];
    
    NSClickGestureRecognizer *signInClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(SignInAction:)];
    [self.SignInLabel addGestureRecognizer:signInClick];
    
    NSClickGestureRecognizer *privateKeyClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(privateKeyAction:)];
    [self.privateKeyButton addGestureRecognizer:privateKeyClick];
    
    NSClickGestureRecognizer *signInButtonClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(signInButtonAction:)];
    [self.SignInButton addGestureRecognizer:signInButtonClick];
}

- (void)signInButtonAction:(id)sender
{
    [self performSegueWithIdentifier:@"MainViewIdentifier" sender:sender];
}

- (void)RegisterAction:(id)sender
{
    self.RegisterLabel.textColor = [NSColor whiteColor];
    self.SignInLabel.textColor = [NSColor colorFromHexString:@"959AA2"];
        //[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
         //   context.duration = 0.5f;
            self.firstView.animator.alphaValue = 0;
            self.secondView.animator.alphaValue = 1;
            self.secondView.animator.hidden = YES;
            self.secondView.animator.hidden = NO;
//        }
//                            completionHandler:^{
//                                self.firstView.hidden = YES;
//                                self.secondView.hidden = NO;
//                                self.firstView.alphaValue = 1;
//                            }];
   // [self fadeInOutAnimation:self.firstView :self.secondView];
    
}

- (void)SignInAction:(id)sender
{
    self.SignInLabel.textColor = [NSColor whiteColor];
    self.RegisterLabel.textColor = [NSColor colorFromHexString:@"959AA2"];
    
    self.firstView.animator.alphaValue = 1;
    self.secondView.animator.alphaValue = 0;
    self.secondView.animator.hidden = NO;
    self.secondView.animator.hidden = YES;
//    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
//        context.duration = 0.1f;
//        self.secondView.animator.alphaValue = 0;
//        self.firstView.animator.alphaValue = 1;
//    }
//                        completionHandler:^{
//                            self.secondView.hidden = YES;
//                            self.firstView.hidden = NO;
//                            self.secondView.alphaValue = 1;
//                        }];
    //[self fadeInOutAnimation:self.secondView :self.firstView];
    
}

- (void)privateKeyAction:(id)sender
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.1f;
        self.passphareView.animator.alphaValue = 0;
        self.secondView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.secondView.hidden = YES;
                            self.passphareView.hidden = NO;
                            self.passphareView.alphaValue = 1;
                        }];
}

- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender
{
    [self.view.window close];
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


@end
