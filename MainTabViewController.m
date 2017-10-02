//
//  MainTabViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "MainTabViewController.h"
#import "MainWindow.h"
#import "MainStoreViewController.h"
#import "BottomDownloadBar.h"
#import <QuartzCore/QuartzCore.h>
#import "LibraryViewController.h"
#import "WalletViewController.h"
#import "SettingsViewController.h"
#import "SettingsContentViewController.h"
#import "FriendsContentViewController.h"
#import "FriendsSideListViewController.h"
#import "NSSplitView+ReplaceView.h"
#import "SettingsNavigationListViewController.h"
#import "SettingsSideListViewController.h"
#import "SplitViewWithDivider.h"
#import "MyRectGradientView.h"
#import "Colours.h"

@interface MainTabViewController (){
    NSWindowController *_controlWindowController;
    BOOL isShowDownloadBar;
    NSImageView *imageView;
    BFNavigationController *_navigationController;
}

@end

@implementation MainTabViewController

-(void)awakeFromNib {
    [super awakeFromNib];
    [self.view setWantsLayer:YES];
    [self.view setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackgroundImage:@"nfs"];
    isShowDownloadBar = NO;
    _mainTabView.delegate = self;
    _mainTabBar.delegate = self;
    
    NSStoryboard *sb1 = [NSStoryboard storyboardWithName:@"Store" bundle:nil];
    MainStoreViewController *mainStoreVC = (MainStoreViewController *)[sb1 instantiateControllerWithIdentifier:@"MainStoreViewController"];
    
    _navigationController = [[BFNavigationController alloc] initWithFrame:NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                       rootViewController:mainStoreVC];
    
    NSStoryboard *sb2 = [NSStoryboard storyboardWithName:@"Library" bundle:nil];
    LibraryViewController *mainLibraryVC = (LibraryViewController *)[sb2 instantiateControllerWithIdentifier:@"LibraryNavigationViewController"];
    
    NSStoryboard *sb3 = [NSStoryboard storyboardWithName:@"Wallet" bundle:nil];
    WalletViewController *mainWalletVC = [sb3 instantiateControllerWithIdentifier:@"WalletViewController"];
    
    NSStoryboard *sb4 = [NSStoryboard storyboardWithName:@"Settings" bundle:nil];
    SettingsContentViewController *mainSettingsVC = (SettingsContentViewController *)[sb4 instantiateControllerWithIdentifier:@"SettingsContentViewController"];
    SettingsNavigationListViewController *navSettingsVC = (SettingsNavigationListViewController *)[sb4 instantiateControllerWithIdentifier:@"SettingsNavigationListViewController"];
    SettingsSideListViewController *serverSettingsVC = (SettingsSideListViewController *)[sb4 instantiateControllerWithIdentifier:@"SettingsSideListViewController"];
    
    SplitViewWithDivider *settingsSplitView = [[SplitViewWithDivider alloc] initWithFrame:self.mainTabView.frame];
    [settingsSplitView setVertical:YES];
    [settingsSplitView setDividerStyle:NSSplitViewDividerStyleThin];
    [settingsSplitView addSubview:mainSettingsVC.view];
    [settingsSplitView addSubview:navSettingsVC.view];
    [settingsSplitView addSubview:serverSettingsVC.view];
    [settingsSplitView adjustSubviews];

    NSTabViewItem *item;
    item = [[self mainTabView] tabViewItemAtIndex:0];
    [item setView:[_navigationController view]];

    item = [[self mainTabView] tabViewItemAtIndex:1];
    [item setView:[mainLibraryVC view]];
    
    item = [[self mainTabView] tabViewItemAtIndex:2];
    [item setView:[mainWalletVC view]];
    
    item = [[self mainTabView] tabViewItemAtIndex:3];
    [item setView:settingsSplitView];
}

-(void)viewWillAppear {
    [super viewWillAppear];
}

-(void)tabClicked:(NSInteger)sender {
    NSLog(@"Delegate Clicked Tab Is %ld", sender);
    [self animation:sender : _mainTabBar.selectedTab];
    if(sender == 0){
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:0]];  
    }else if (sender == 1){
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:1]];
    }else if (sender == 2){
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:2]];
    }else if (sender == 3){//friends
        NSSplitView *superView = (NSSplitView *)[_mainTabView.tabViewItems objectAtIndex:3].view;
        
        //get friends edit content view
        NSStoryboard *friends = [NSStoryboard storyboardWithName:@"Friends" bundle:nil];
        NSViewController *friendsVC = [friends instantiateControllerWithIdentifier:@"MainFriendsLeftSideViewController"];
        //replace friends and settings view
        [superView replaceSplitViewItemAtIndex:0 withViewController:friendsVC];
        
        //change tabview item
        if(![_mainTabView.selectedTabViewItem isEqual:[_mainTabView.tabViewItems objectAtIndex:3]])
            [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:3]];
    }else if (sender == 4){//settings
        NSSplitView *superView = (NSSplitView *)[_mainTabView.tabViewItems objectAtIndex:3].view;
        
        //get friends edit content view
        NSStoryboard *settings = [NSStoryboard storyboardWithName:@"Settings" bundle:nil];
        SettingsContentViewController *settingsVC = (SettingsContentViewController *)[settings instantiateControllerWithIdentifier:@"SettingsContentViewController"];
        //replace friends and settings view
        [superView replaceSplitViewItemAtIndex:0 withViewController:settingsVC];
        
        //change tabview item
        if(![_mainTabView.selectedTabViewItem isEqual:[_mainTabView.tabViewItems objectAtIndex:3]])
             [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:3]];
    }
}

-(void)animation : (NSInteger) toItem : (NSInteger) fromItem {

}

- (void)tabView:(NSTabView *)tabView didSelectTabViewItem:(NSTabViewItem *)tabViewItem {
    
}

-(void)downloadsButtonClick {
    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
    BottomDownloadBar *downloadBar = [[BottomDownloadBar alloc] initWithFrame:CGRectMake(mainWindow.contentView.frame.origin.x,
                                                                                         mainWindow.contentView.frame.origin.y,
                                                                                         mainWindow.contentView.frame.size.width,
                                                                                         75.0f)];
    if(!isShowDownloadBar) {
        [mainWindow.contentView addSubview:downloadBar positioned:NSWindowOut relativeTo:nil];
        [mainWindow.contentView setNeedsDisplay:YES];
        isShowDownloadBar = YES;
    } else {
        [downloadBar removeFromSuperview];
        [mainWindow.contentView setNeedsDisplay:YES];
        isShowDownloadBar = NO;
    }
}

-(void)setBackgroundImage : (NSString *) imageName {
    if(imageView == nil) {
        imageView = [[NSImageView alloc] initWithFrame:self.view.frame];
        [imageView setImageScaling:NSImageScaleAxesIndependently];
        [imageView setImageAlignment:NSImageAlignCenter];
        [imageView setImage:[NSImage imageNamed:imageName]];
        [imageView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        
        [self.view addSubview:imageView positioned:NSWindowBelow relativeTo:self.view];
        
        MyRectGradientView *rectGradientView = [[MyRectGradientView alloc] initWithFrame:self.view.frame];
        [rectGradientView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        
        [rectGradientView setStartColor:[NSColor colorWithRed:(23/255) green:(26/255) blue:(38/255) alpha:.9f]];
        [rectGradientView setEndColor:[NSColor colorWithRed:(23/255) green:(26/255) blue:(38/255) alpha:.9f]];
        [rectGradientView setAngle:90.0];
        
        [self.view addSubview:rectGradientView positioned:NSWindowAbove relativeTo:imageView];
        
        NSDictionary * views = NSDictionaryOfVariableBindings(imageView);
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];
        
        NSDictionary * rectViews = NSDictionaryOfVariableBindings(rectGradientView);
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[rectGradientView]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:rectViews]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rectGradientView]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:rectViews]];
    }
    
}

@end
