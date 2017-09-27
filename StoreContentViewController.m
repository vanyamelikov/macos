//
//  StoreContentViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreContentViewController.h"
#import "StoreGamesView.h"
#import "StoreGamesGridView.h"
#import "StoreMainGridView.h"

@interface StoreContentViewController ()

@end

@implementation StoreContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSSplitViewController *view = (NSSplitViewController *)self.parentViewController;
    StoreSideMenu *storeSideMenu = view.splitViewItems[0].viewController.view.subviews[1];
    storeSideMenu.delegate = self;
    
    StoreGamesView *storeGamesList = [[StoreGamesView alloc] initWithFrame:self.gamesTabController.frame];
    StoreGamesGridView *storeGamesGrid = [[StoreGamesGridView alloc] initWithFrame:self.gamesTabController.frame];
    StoreMainGridView *storeMainGridView = [[StoreMainGridView alloc] initWithFrame:CGRectMake(self.gamesTabController.frame.origin.x,
                                                                                               self.gamesTabController.frame.origin.x, 1134, 594)];
    
    NSTabViewItem *item;
    item = [[self gamesTabController] tabViewItemAtIndex:0];
    [item setView:storeGamesList];
    
    item = [[self gamesTabController] tabViewItemAtIndex:1];
    [item setView:storeGamesGrid];
    
    item = [[self gamesTabController] tabViewItemAtIndex:2];
    [item setView:storeMainGridView];
}

- (IBAction)ChangeToListClick:(NSClickGestureRecognizer *)sender {
    [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:0]];
}

- (IBAction)ChangeToGridClick:(NSClickGestureRecognizer *)sender {
    [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:1]];
}

-(void)itemClicked:(NSInteger)sender :(NSString *)title {
    if(sender == 1) {
        [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:2]];
    }
    self.storeCategoriesTitle.stringValue = title;
}

@end
