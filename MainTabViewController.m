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
#import <QuartzCore/QuartzCore.h>
#import "LibraryViewController.h"
#import "WalletMainViewController.h"
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
#import "FriendsProfileViewController.h"
#import "ChatMainView.h"
#import "DownloadsViewController.h"

@interface MainTabViewController (){
    NSWindowController *_controlWindowController;
    BOOL isShowDownloadBar;
    BOOL isShowMainChatView;
    NSImageView *imageView;
    BFNavigationController *_navigationController;
    BottomDownloadBar *downloadBar;
    ChatMainView *mainChatView;
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
    [self setBackgroundImage:@"background_store_1"];
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
    WalletMainViewController *mainWalletVC = [sb3 instantiateControllerWithIdentifier:@"WalletMainViewController"];
    
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
    [item setViewController:mainWalletVC];
    
    item = [[self mainTabView] tabViewItemAtIndex:3];
    [item setView:settingsSplitView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeBackground:)
                                                 name:@"changeBackgroundNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(openFriendsProfile:)
                                                 name:@"openFriendsProfileNotification"
                                               object:nil];
}

-(void)viewWillAppear {
    [super viewWillAppear];
}

- (void) changeBackground:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"changeBackgroundNotification"])
        [self setBackgroundImage:notification.object];
}

-(void) openFriendsProfile:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"openFriendsProfileNotification"]) {
        NSSplitView *superView = (NSSplitView *)[_mainTabView.tabViewItems objectAtIndex:3].view;
        
        //get friends edit content view
        NSStoryboard *friends = [NSStoryboard storyboardWithName:@"Friends" bundle:nil];
        FriendsProfileViewController *friendProfileVC = (FriendsProfileViewController *)[friends instantiateControllerWithIdentifier:@"FriendsProfileViewController"];
        
        //replace friends and settings view
        [superView replaceSplitViewItemAtIndex:0 withViewController:friendProfileVC.view];
        
        //change tabview item
        if(![_mainTabView.selectedTabViewItem isEqual:[_mainTabView.tabViewItems objectAtIndex:3]])
            [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:3]];
    }
}

-(void)tabClicked:(NSInteger)sender {
    NSLog(@"Delegate Clicked Tab Is %ld", sender);
    [self animation:sender : _mainTabBar.selectedTab];
    if(sender == 0){
        [self setBackgroundImage:@"background_store_1"];
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:0]];  
    }else if (sender == 1){
        [self setBackgroundImage:@"background_library"];
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:1]];
    }else if (sender == 2){
        [self setBackgroundImage:@"background_main"];
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:2]];
    }else if (sender == 3){//friends
        [self setBackgroundImage:@"background_profile"];
        NSSplitView *superView = (NSSplitView *)[_mainTabView.tabViewItems objectAtIndex:3].view;
        
        //get friends edit content view
        NSStoryboard *friends = [NSStoryboard storyboardWithName:@"Friends" bundle:nil];
        NSViewController *friendsVC = [friends instantiateControllerWithIdentifier:@"MainFriendsLeftSideViewController"];
        
        //replace friends and settings view
        [superView replaceSplitViewItemAtIndex:0 withViewController:friendsVC.view];
        
        //change tabview item
        if(![_mainTabView.selectedTabViewItem isEqual:[_mainTabView.tabViewItems objectAtIndex:3]])
            [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:3]];
    }else if (sender == 4){//settings
        [self setBackgroundImage:@"background_profile"];
        NSSplitView *superView = (NSSplitView *)[_mainTabView.tabViewItems objectAtIndex:3].view;
        
        //get friends edit content view
        NSStoryboard *settings = [NSStoryboard storyboardWithName:@"Settings" bundle:nil];
        SettingsContentViewController *settingsVC = (SettingsContentViewController *)[settings instantiateControllerWithIdentifier:@"SettingsContentViewController"];
        //replace friends and settings view
        [superView replaceSplitViewItemAtIndex:0 withViewController:settingsVC.view];
        
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
    if(!downloadBar) {
        downloadBar = [[BottomDownloadBar alloc] initWithFrame:CGRectMake(mainWindow.contentView.frame.origin.x,
                                                                          mainWindow.contentView.frame.origin.y,
                                                                          mainWindow.contentView.frame.size.width,
                                                                          75.0f)];
        downloadBar.delegate = self;
        [downloadBar setAutoresizingMask:NSViewWidthSizable];
        [downloadBar setTranslatesAutoresizingMaskIntoConstraints:YES];
    }
    if(!isShowDownloadBar) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [mainWindow.animator.contentView addSubview:downloadBar positioned:NSWindowOut relativeTo:nil];
        [mainWindow.animator.contentView setNeedsDisplay:YES];
        isShowDownloadBar = YES;
        [NSAnimationContext endGrouping];
    } else {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [downloadBar.animator removeFromSuperview];
        [mainWindow.animator.contentView setNeedsDisplay:YES];
        isShowDownloadBar = NO;
        [NSAnimationContext endGrouping];
    }
}

-(void)closeBottomDownloads {
    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
    if(!downloadBar) {
        downloadBar = [[BottomDownloadBar alloc] initWithFrame:CGRectMake(mainWindow.contentView.frame.origin.x,
                                                                          mainWindow.contentView.frame.origin.y,
                                                                          mainWindow.contentView.frame.size.width,
                                                                          75.0f)];
        downloadBar.delegate = self;
        [downloadBar setAutoresizingMask:NSViewWidthSizable];
        [downloadBar setTranslatesAutoresizingMaskIntoConstraints:YES];
    }
    if(!isShowDownloadBar) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [mainWindow.animator.contentView addSubview:downloadBar positioned:NSWindowOut relativeTo:nil];
        [mainWindow.animator.contentView setNeedsDisplay:YES];
        isShowDownloadBar = YES;
        [NSAnimationContext endGrouping];
    } else {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [downloadBar.animator removeFromSuperview];
        [mainWindow.animator.contentView setNeedsDisplay:YES];
        isShowDownloadBar = NO;
        [NSAnimationContext endGrouping];
    }
}

-(void)openChatEvent {
    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
    if(!mainChatView) {
        mainChatView = [[ChatMainView alloc] initWithFrame:CGRectMake(mainWindow.contentView.frame.size.width - 26.0f - 262.0f,
                                                                          mainWindow.contentView.frame.origin.y,
                                                                          262.0f,
                                                                          334.0f)];
    }
    if(!isShowMainChatView) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [mainWindow.animator.contentView addSubview:mainChatView positioned:NSWindowOut relativeTo:nil];
        [mainWindow.animator.contentView setNeedsDisplay:YES];
        isShowMainChatView = YES;
        [NSAnimationContext endGrouping];
    } else {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [mainChatView.animator removeFromSuperview];
        [mainWindow.animator.contentView setNeedsDisplay:YES];
        isShowMainChatView = NO;
        [NSAnimationContext endGrouping];
    }
}

-(void)setBackgroundImage : (NSString *) imageName {
    if(imageView == nil) {
        imageView = [[NSImageView alloc] initWithFrame:self.view.frame];
        [imageView setImage:[NSImage imageNamed:imageName]];
        [imageView setImageScaling:NSImageScaleAxesIndependently];
        [imageView setImageAlignment:NSImageAlignCenter];
        [imageView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        
        [self.view addSubview:imageView positioned:NSWindowBelow relativeTo:self.view];
        
        
        
        NSDictionary * views = NSDictionaryOfVariableBindings(imageView);
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];

    } else {
        [imageView setImage:[NSImage imageNamed:imageName]];
    }
    
}

- (void) dealloc
{
    // If you don't remove yourself as an observer, the Notification Center
    // will continue to try and send notification objects to the deallocated
    // object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //[super dealloc];
}

-(void)openDownloadsViewController {
    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
    if(!isShowDownloadBar) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [mainWindow.animator.contentView addSubview:downloadBar positioned:NSWindowOut relativeTo:nil];
        [mainWindow.animator.contentView setNeedsDisplay:YES];
        isShowDownloadBar = YES;
        [NSAnimationContext endGrouping];
    } else {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [downloadBar.animator removeFromSuperview];
        [mainWindow.animator.contentView setNeedsDisplay:YES];
        isShowDownloadBar = NO;
        [NSAnimationContext endGrouping];
        
        NSStoryboard *sb1 = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
        DownloadsViewController *downloadsVC = (DownloadsViewController *)[sb1 instantiateControllerWithIdentifier:@"DownloadsViewController"];
        [downloadsVC.view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [downloadsVC.view setTranslatesAutoresizingMaskIntoConstraints:YES];
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.0f];
        [[_mainTabView tabViewItemAtIndex:0].view.animator addSubview:downloadsVC.view positioned:NSWindowOut relativeTo:nil];
        //[mainWindow.animator.contentView addSubview:downloadsVC.view positioned:NSWindowOut relativeTo:nil];
        [[_mainTabView tabViewItemAtIndex:0].view.animator setNeedsDisplay:YES];
        [NSAnimationContext endGrouping];
    }
}

@end
