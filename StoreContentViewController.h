//
//  StoreContentViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StoreSideMenu.h"

@interface StoreContentViewController : NSViewController <NSTabViewDelegate, StoreSideMenuDelegate>
@property (weak) IBOutlet NSTabView *gamesTabController;
@end
