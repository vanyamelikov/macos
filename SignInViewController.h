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
#import "TextFieldWithTag.h"

@interface SignInViewController : NSViewController <PassphraseViewDelegate, NSTextFieldDelegate, TextFieldWithTagDelegate>

@property (strong) IBOutlet NSTextField *SignInLabel;
@property (strong) IBOutlet NSTextField *RegisterLabel;
@property (strong) IBOutlet TextFieldWithTag *loginTextField;
@property (strong) IBOutlet TextFieldWithTag *passwordTextField;
@property (strong) IBOutlet SignInButton *SignInButton;
@property (strong) IBOutlet NSTextField *forgotPasswordLabel;

@property (strong) IBOutlet NSView *firstView;
@property (strong) IBOutlet NSView *secondView;

@property (strong) IBOutlet PassphraseView *passphareView;
@property (strong) IBOutlet PrivateKeyButton *privateKeyButton;

@property (weak) IBOutlet NSBox *loginBox;
@property (weak) IBOutlet NSBox *passwordBox;


@end
