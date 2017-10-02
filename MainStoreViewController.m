//
//  MainStoreViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 18.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "MainStoreViewController.h"

@interface MainStoreViewController ()

@end

@implementation MainStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    StoreContentViewController *storeContentVC = (StoreContentViewController *)self.childViewControllers[1];
    StoreGamesView *gamesListView = (StoreGamesView *)storeContentVC.gamesTabController.tabViewItems[0].view;
    StoreGamesGridView *gamesGridView = (StoreGamesGridView *)storeContentVC.gamesTabController.tabViewItems[1].view;
    StoreMainGridView *gamesMainGrid = (StoreMainGridView *)storeContentVC.gamesTabController.tabViewItems[2].view;
    gamesListView.delegate = self;
}

#pragma mark - StoreGamesViewDelegate

-(void)tableViewItemClicked:(id)item {
    NSLog(@"Coming object is = %@", item);
}

@end
