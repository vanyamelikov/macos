//
//  MainTabViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CustomTabbar.h"

@interface MainTabViewController : NSViewController <CustomTabbarDelegate, NSTabViewDelegate>
@property (strong) IBOutlet NSTabView *mainTabView;
@property (strong) IBOutlet CustomTabbar *mainTabBar;

@end
