//
//  LibrarySideMenuViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibrarySideMenuViewController.h"

@interface LibrarySideMenuViewController ()
@property (nonatomic) LibraryContentViewController *contentVC;
@end

@implementation LibrarySideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSSplitViewController *splitViewController = (NSSplitViewController *)self.parentViewController;
    self.contentVC = (LibraryContentViewController *)[[splitViewController splitViewItems] objectAtIndex:1].viewController;
    LibraryEmptyView *emptyView = (LibraryEmptyView *)self.contentVC.view.subviews[1];
    emptyView.addGameDelegate = self;
}

-(void)libraryEmtyAddGameClick {
    self.librarySideEmptyView.hidden = YES;
    self.librarySideMenu.hidden = NO;
    self.contentVC.libraryEmptyView.hidden = YES;
    self.contentVC.libraryGameView.hidden = NO;
}

@end
