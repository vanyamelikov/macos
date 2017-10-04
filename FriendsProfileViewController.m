//
//  FriendsProfileViewController.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FriendsProfileViewController.h"

@interface FriendsProfileViewController ()

@end

@implementation FriendsProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.friendAvatarImageView setWantsLayer:YES];
    [self.friendAvatarImageView.layer setCornerRadius:8.0f];
    [self.friendAvatarImageView.layer setMasksToBounds:YES];
}

@end
