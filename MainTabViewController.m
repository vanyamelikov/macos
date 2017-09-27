//
//  MainTabViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "MainTabViewController.h"
#import "BFNavigationController.h"
#import "NSViewController+BFNavigationController.h"
#import <QuartzCore/QuartzCore.h>

@interface MainTabViewController (){
    BFNavigationController *_navigationController;
    NSWindowController *_controlWindowController;
}

@end

@implementation MainTabViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _mainTabView.delegate = self;
    _mainTabBar.delegate = self;
    
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSViewController *vc1 = [sb instantiateControllerWithIdentifier:@"ViewController1"];
    NSViewController *vc2 = [sb instantiateControllerWithIdentifier:@"ViewController2"];
    NSViewController *vc3 = [sb instantiateControllerWithIdentifier:@"ViewController3"];
    NSViewController *vc4 = [sb instantiateControllerWithIdentifier:@"ViewController4"];
    NSViewController *vc5 = [sb instantiateControllerWithIdentifier:@"ViewController5"];
    NSViewController *vc6 = [sb instantiateControllerWithIdentifier:@"ViewController6"];
    NSViewController *vc7 = [sb instantiateControllerWithIdentifier:@"ViewController7"];

    NSTabViewItem *item;
    item = [[self mainTabView] tabViewItemAtIndex:0];
    [item setView:[vc1 view]];

    item = [[self mainTabView] tabViewItemAtIndex:1];
    [item setView:[vc2 view]];
    
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

@end
