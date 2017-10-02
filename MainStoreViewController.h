//
//  MainStoreViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 18.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StoreSideMenuViewController.h"
#import "StoreContentViewController.h"
#import "NSViewController+BFNavigationController.h"
#import "BFNavigationController.h"
#import "StoreGamesView.h"
#import "StoreGamesGridView.h"
#import "StoreMainGridView.h"

@interface MainStoreViewController : NSSplitViewController <StoreGamesViewDelegate, StoreGamesGridViewDelegate>

@end
