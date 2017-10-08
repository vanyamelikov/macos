//
//  MainTabViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CustomTabbar.h"
#import "BFNavigationController.h"
#import "NSViewController+BFNavigationController.h"
#import "BottomDownloadBar.h"
#import "ChatMainView.h"

@interface MainTabViewController : NSViewController <CustomTabbarDelegate, NSTabViewDelegate, BottomDownloadBarDelegate, ChatMainViewDelegate>

@property (strong) IBOutlet NSTabView *mainTabView;
@property (strong) IBOutlet CustomTabbar *mainTabBar;
@property (weak) IBOutlet NSLayoutConstraint *bottomTabViewSpace;
-(void)setBackgroundImage : (NSString *) imageName;

@end
