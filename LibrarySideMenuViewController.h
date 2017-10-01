//
//  LibrarySideMenuViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LibraryContentViewController.h"
#import "LibraryEmptyView.h"
#import "LibrarySideMenu.h"
#import "LibraryEmptySideMenu.h"

@interface LibrarySideMenuViewController : NSViewController <LibraryAddGameDelegate>
@property (weak) IBOutlet LibrarySideMenu *librarySideMenu;
@property (weak) IBOutlet LibraryEmptySideMenu *librarySideEmptyView;

@end
