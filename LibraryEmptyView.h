//
//  LibraryEmptyView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 01.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "AddGameButton.h"

@class LibraryEmptyView;

@protocol LibraryAddGameDelegate <NSObject>
-(void)libraryEmtyAddGameClick;
@end

@interface LibraryEmptyView : INSNibLoadedView 

@property (weak) IBOutlet AddGameButton *addGameButton;

@property (nonatomic, weak) id<LibraryAddGameDelegate> addGameDelegate;

@end
