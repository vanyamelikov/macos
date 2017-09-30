//
//  LibrarySideMenuViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibrarySideMenuViewController.h"
#import "LibrarySideMenu.h"

@interface LibrarySideMenuViewController ()

@end

@implementation LibrarySideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSSplitViewController *splitViewController = (NSSplitViewController *)self.parentViewController;
    LibraryContentViewController *contentVC = (LibraryContentViewController *)[[splitViewController splitViewItems] objectAtIndex:1].viewController;
    contentVC.addGameDelegate = self;
}

-(void)libraryEmtyAddGameClick {
    LibrarySideMenu *sideMenu = [[LibrarySideMenu alloc] initWithFrame:self.view.frame];
    self.view.subviews[0].hidden = YES;
    [self.view addSubview:sideMenu positioned:NSWindowAbove relativeTo:self.view.subviews[0]];
}

@end
