//
//  LibraryContentViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AddGameButton.h"

@class LibraryContentViewController;

@protocol LibraryAddGameDelegate <NSObject>
-(void)libraryEmtyAddGameClick;
@end

@interface LibraryContentViewController : NSViewController

@property (strong) IBOutlet NSView *libraryEmptyView;
@property (strong) IBOutlet NSView *libraryGameView;
@property (strong) IBOutlet AddGameButton *addGameButton;

@property (nonatomic, weak) id<LibraryAddGameDelegate> addGameDelegate;

@end
