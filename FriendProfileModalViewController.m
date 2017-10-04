//
//  FriendProfileModalViewController.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FriendProfileModalViewController.h"

@interface FriendProfileModalViewController ()

@end

@implementation FriendProfileModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)openFriendProfileClick:(NSClickGestureRecognizer *)sender {
    //openFriendsProfileNotification
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"openFriendsProfileNotification"
     object:@"background_purchase"];
}

@end
