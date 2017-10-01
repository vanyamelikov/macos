//
//  LibraryContentViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LibraryEmptyView.h"
#import "LibraryGameView.h"

@interface LibraryContentViewController : NSViewController

@property (weak) IBOutlet LibraryEmptyView *libraryEmptyView;
@property (weak) IBOutlet LibraryGameView *libraryGameView;


@end
