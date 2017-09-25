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

    self.secondView.hidden = YES;
    self.passphareView.hidden = YES;

    NSClickGestureRecognizer *registerClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(RegisterAction:)];
    [self.RegisterLabel addGestureRecognizer:registerClick];
    
    NSClickGestureRecognizer *signInClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(SignInAction:)];
    [self.SignInLabel addGestureRecognizer:signInClick];
    
    NSClickGestureRecognizer *privateKeyClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(privateKeyAction:)];
    [self.privateKeyButton addGestureRecognizer:privateKeyClick];
}

- (void)RegisterAction:(id)sender
{
    self.RegisterLabel.textColor = [NSColor whiteColor];
    self.SignInLabel.textColor = [NSColor colorFromHexString:@"959AA2"];
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.firstView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.firstView.hidden = YES;
                            self.secondView.hidden = NO;
                            self.firstView.alphaValue = 1;
                        }];
    
}

- (void)SignInAction:(id)sender
{
    self.SignInLabel.textColor = [NSColor whiteColor];
    self.RegisterLabel.textColor = [NSColor colorFromHexString:@"959AA2"];
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.secondView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.secondView.hidden = YES;
                            self.firstView.hidden = NO;
                            self.secondView.alphaValue = 1;
                        }];
    
}

- (void)privateKeyAction:(id)sender
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.passphareView.animator.alphaValue = 0;
        self.secondView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.secondView.hidden = YES;
                            self.passphareView.hidden = NO;
                            self.passphareView.alphaValue = 1;
                        }];
}




@end
