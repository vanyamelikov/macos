//
//  SettingsSideListViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SettingsSideListViewController.h"

@interface SettingsSideListViewController ()
@property (weak) IBOutlet NSBox *friendsRequestBox;

@end

@implementation SettingsSideListViewController {
    JMModalOverlay *modalOverlay;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)friendsRequestClick:(id)sender {
    
}

//FriendsModalOverlay

- (IBAction)openFriendsRequest:(id)sender {
    NSStoryboard *friends = [NSStoryboard storyboardWithName:@"Friends" bundle:nil];
    NSViewController *friendsVC = [friends instantiateControllerWithIdentifier:@"FriendsModalOverlay"];
    modalOverlay.contentViewController = friendsVC;
    modalOverlay.animates = YES;
    modalOverlay.animationDirection = JMModalOverlayDirectionBottom;
    modalOverlay.shouldOverlayTitleBar = YES;
    modalOverlay.shouldCloseWhenClickOnBackground = NO;
    modalOverlay.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantDark];
    modalOverlay.backgroundColor = [NSColor colorWithCalibratedWhite:0.0 alpha:0.0];
    [modalOverlay showInWindow:self.view.window];
}


@end
