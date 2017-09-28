//
//  MainTabViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "MainTabViewController.h"
#import "MainWindow.h"
#import "BFNavigationController.h"
#import "NSViewController+BFNavigationController.h"
#import "MainStoreViewController.h"
#import "BottomDownloadBar.h"
#import <QuartzCore/QuartzCore.h>
#import "LibraryViewController.h"

@interface MainTabViewController (){
    BFNavigationController *_navigationController;
    NSWindowController *_controlWindowController;
    BOOL isShowDownloadBar;
}

@end

@implementation MainTabViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    isShowDownloadBar = NO;
    _mainTabView.delegate = self;
    _mainTabBar.delegate = self;
    
    NSStoryboard *sb1 = [NSStoryboard storyboardWithName:@"Store" bundle:nil];
    MainStoreViewController *mainStoreVC = (MainStoreViewController *)[sb1 instantiateControllerWithIdentifier:@"MainStoreViewController"];
    
    NSStoryboard *sb2 = [NSStoryboard storyboardWithName:@"Library" bundle:nil];
    LibraryViewController *mainLibraryVC = (LibraryViewController *)[sb2 instantiateControllerWithIdentifier:@"LibraryNavigationViewController"];
    
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSViewController *vc3 = [sb instantiateControllerWithIdentifier:@"ViewController3"];
    NSViewController *vc4 = [sb instantiateControllerWithIdentifier:@"ViewController4"];
    NSViewController *vc5 = [sb instantiateControllerWithIdentifier:@"ViewController5"];
    NSViewController *vc6 = [sb instantiateControllerWithIdentifier:@"ViewController6"];
    NSViewController *vc7 = [sb instantiateControllerWithIdentifier:@"ViewController7"];

    NSTabViewItem *item;
    item = [[self mainTabView] tabViewItemAtIndex:0];
    [item setView:[mainStoreVC view]];

    item = [[self mainTabView] tabViewItemAtIndex:1];
    [item setView:[mainLibraryVC view]];
    
    item = [[self mainTabView] tabViewItemAtIndex:2];
    [item setView:[vc3 view]];
    
    item = [[self mainTabView] tabViewItemAtIndex:3];
    [item setView:[vc4 view]];
    
    item = [[self mainTabView] tabViewItemAtIndex:4];
    [item setView:[vc5 view]];
    
    item = [[self mainTabView] tabViewItemAtIndex:5];
    [item setView:[vc6 view]];
    
    item = [[self mainTabView] tabViewItemAtIndex:6];
    [item setView:[vc7 view]];

}

-(void)viewWillAppear {
    [super viewWillAppear];
    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
    [mainWindow changeBackgroundImage:[NSImage imageNamed:@"nfs"]];
    [mainWindow setMovableByWindowBackground:YES];
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
    }else if (sender == 3){
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:3]];
    }else if (sender == 4){
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:4]];
    }else if (sender == 5){
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:5]];
    }else if (sender == 6){
        [_mainTabView selectTabViewItem:[_mainTabView.tabViewItems objectAtIndex:6]];
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

@end
