//
//  SignInViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TextFieldWithFriend.h"
#import "SignInButton.h"
#import "PassphraseView.h"
#import "PrivateKeyButton.h"

@interface SignInViewController : NSViewController

@property (strong) IBOutlet NSTextField *SignInLabel;
@property (strong) IBOutlet NSTextField *RegisterLabel;
@property (strong) IBOutlet TextFieldWithFriend *loginTextField;
@property (strong) IBOutlet TextFieldWithFriend *passwordTextField;
@property (strong) IBOutlet SignInButton *SignInButton;
@property (strong) IBOutlet NSTextField *forgotPasswordLabel;

@property (strong) IBOutlet NSView *firstView;
@property (strong) IBOutlet NSView *secondView;

@property (strong) IBOutlet PassphraseView *passphareView;
@property (strong) IBOutlet PrivateKeyButton *privateKeyButton;

@end
