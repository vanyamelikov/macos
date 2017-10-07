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
#import "ImageUtils.h"
#import "MainWindow.h"
#import "MyRectGradientView.h"
#import "Colours.h"

@interface SignInViewController ()

@end

@implementation SignInViewController {
    NSColor *focusTFBorderColor;
    NSColor *unFocusTFBorderColor;
    CGFloat tfAnimationDuration;
    NSImageView *imageView;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self.view setWantsLayer:YES];
    [self.view setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackgroundImage:@"background_main"];
    
    focusTFBorderColor = [NSColor colorFromHexString:@"5c5e66"];
    unFocusTFBorderColor = [NSColor colorFromHexString:@"383943"];
    tfAnimationDuration = 2.0f;
    
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
    
    [self.loginBox setWantsLayer:YES];
    [self.passwordBox setWantsLayer:YES];
    [self.view setWantsLayer:YES];
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.loginTextField.tagDelegate = self;
    self.passwordTextField.tagDelegate = self;
}

- (void)signInButtonAction:(id)sender
{
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    MainTabViewController *vc = (MainTabViewController *)[sb instantiateControllerWithIdentifier:@"MainTabViewController"];
    [self.view.window setContentViewController:vc];
}

- (void)RegisterAction:(id)sender
{
    self.RegisterLabel.textColor = [NSColor whiteColor];
    self.SignInLabel.textColor = [NSColor colorFromHexString:@"959AA2"];
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.5];
    self.firstView.animator.hidden = YES;
    self.secondView.animator.hidden = NO;
    [NSAnimationContext endGrouping];
}

- (void)SignInAction:(id)sender
{
    self.SignInLabel.textColor = [NSColor whiteColor];
    self.RegisterLabel.textColor = [NSColor colorFromHexString:@"959AA2"];
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.5];
    self.secondView.animator.hidden = YES;
    self.firstView.animator.hidden = NO;
    [NSAnimationContext endGrouping];
}

- (void)privateKeyAction:(id)sender
{
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.5];
    self.secondView.animator.hidden = YES;
    self.passphareView.animator.hidden = NO;
    [NSAnimationContext endGrouping];
}

-(void)passphraseViewDismiss {
    
    self.firstView.hidden = YES;
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.5];
    self.passphareView.animator.hidden = YES;
    self.secondView.animator.hidden = NO;
    [NSAnimationContext endGrouping];
}

-(void)controlTextDidEndEditing:(NSNotification *)obj {
    TextFieldWithTag *textField = (TextFieldWithTag *)[obj object];
    if(textField.mTag == 1) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:tfAnimationDuration];
        self.loginBox.animator.borderColor = unFocusTFBorderColor;
        self.loginBox.borderColor = unFocusTFBorderColor;
        [self.loginBox setNeedsDisplay:YES];
        [NSAnimationContext endGrouping];
    } else if(textField.mTag == 2) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:tfAnimationDuration];
        self.passwordBox.animator.borderColor = unFocusTFBorderColor;
        self.passwordBox.borderColor = unFocusTFBorderColor;
        [self.passwordBox setNeedsDisplay:YES];
        [NSAnimationContext endGrouping];
    }
}

-(void)textFieldSelected:(NSTextField *)sender {
    TextFieldWithTag *textField = (TextFieldWithTag *)sender;
    if(textField.mTag == 1) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:tfAnimationDuration];
        self.loginBox.animator.borderColor = focusTFBorderColor;
        self.loginBox.borderColor = focusTFBorderColor;
        [self.loginBox setNeedsDisplay:YES];
        [NSAnimationContext endGrouping];
    } else if(textField.mTag == 2) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:tfAnimationDuration];
        self.passwordBox.animator.borderColor = focusTFBorderColor;
        self.passwordBox.borderColor = focusTFBorderColor;
        [self.passwordBox setNeedsDisplay:YES];
        [NSAnimationContext endGrouping];
    }
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
