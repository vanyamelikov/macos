//
//  ProfileModalViewController.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ProfileModalViewController.h"

@interface ProfileModalViewController ()

@end

@implementation ProfileModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)openProfileClick:(id)sender {
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"changeBackgroundNotification"
     object:@"background_profile"];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"openFriendsProfileNotification"
     object:@"background_purchase"];
}

@end
