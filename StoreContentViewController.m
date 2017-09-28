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
#import "ImageUtils.h"
#import "Colours.h"

@interface StoreContentViewController ()

@end

@implementation StoreContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSSplitViewController *view = (NSSplitViewController *)self.parentViewController;
    StoreSideMenu *storeSideMenu = view.splitViewItems[0].viewController.view.subviews[0];
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
    
    [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:2]];
}

- (IBAction)ChangeToListClick:(NSClickGestureRecognizer *)sender {
    if(![self.gamesTabController.selectedTabViewItem isEqual:[self.gamesTabController.tabViewItems objectAtIndex:0]]) {
        [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:0]];
        self.listImageView.image = [ImageUtils imageTintedWithColor:[NSColor colorFromHexString:@"#69a2a9c1"] : self.listImageView.image];
        self.gridImageView.image = [ImageUtils imageTintedWithColor:[NSColor whiteColor] : self.gridImageView.image];
    }
}

- (IBAction)ChangeToGridClick:(NSClickGestureRecognizer *)sender {
    if(![self.gamesTabController.selectedTabViewItem isEqual:[self.gamesTabController.tabViewItems objectAtIndex:1]]) {
        [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:1]];
        self.listImageView.image = [ImageUtils imageTintedWithColor:[NSColor whiteColor] : self.listImageView.image];
        self.gridImageView.image = [ImageUtils imageTintedWithColor:[NSColor colorFromHexString:@"#69a2a9c1"] : self.gridImageView.image];
    }
}

-(void)itemClicked:(NSInteger)sender :(NSString *)title {
    if(sender == 2) {
        [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:2]];
    }
    self.storeCategoriesTitle.stringValue = title;
}

@end
