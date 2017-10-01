//
//  LibraryContentViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryContentViewController.h"
#import "LibraryEmptySideMenu.h"
#import "SplitViewWithDivider.h"
#import "MainWindow.h"
#import "LibraryGameView.h"
#import "LibraryEmptyView.h"

@interface LibraryContentViewController ()

@end

@implementation LibraryContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.libraryGameView.hidden = YES;
    self.libraryEmptyView.hidden = NO;
}

-(void)viewWillAppear {
    [super viewWillAppear];
//    SplitViewWithDivider *splitViewController = (SplitViewWithDivider*)self.view.superview.superview;
//    NSTabView *vc = (NSTabView *)splitViewController.superview.superview;
//    NSView *view1 = [vc.tabViewItems[0] view];
//    NSImage *img = [self imageRepresentation:view1];
//
//    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
//    [mainWindow changeBackgroundImage:img];
//    [mainWindow setMovableByWindowBackground:YES];
}




@end
