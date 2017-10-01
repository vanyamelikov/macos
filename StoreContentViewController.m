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
#import "MainWindow.h"

@interface StoreContentViewController ()
@property (nonatomic) StoreMainGridView *storeMainGridView;
@end

@implementation StoreContentViewController

#define kShowListGridButtons 108.0f
#define kHideListGridButtons 26.0f

//1134,
//594)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSSplitViewController *view = (NSSplitViewController *)self.parentViewController;
    StoreSideMenu *storeSideMenu = view.splitViewItems[0].viewController.view.subviews[0];
    storeSideMenu.delegate = self;
    
    StoreGamesView *storeGamesList = [[StoreGamesView alloc] initWithFrame:self.gamesTabController.frame];
    StoreGamesGridView *storeGamesGrid = [[StoreGamesGridView alloc] initWithFrame:self.gamesTabController.frame];
    NSLog(@"X is = %f", self.gamesTabController.frame.origin.x);
    NSLog(@"Y is = %f", self.gamesTabController.frame.origin.x);
    NSLog(@"W is = %f", self.gamesTabController.frame.size.width);
    NSLog(@"H is = %f", self.gamesTabController.frame.size.height);
    self.storeMainGridView = [[StoreMainGridView alloc] initWithFrame:CGRectMake(self.gamesTabController.frame.origin.x,
                                                                                 self.gamesTabController.frame.origin.x,
                                                                                 1134,
                                                                                 594)];
    
    [self.storeMainGridView setWantsLayer:YES];
    [self.gamesTabController.layer setMasksToBounds:YES];
    [self.storeMainGridView.layer setContentsGravity:kCAGravityResizeAspect];
    
    [self.storeMainGridView setWantsBestResolutionOpenGLSurface:YES];
    [self.storeMainGridView setAutoresizesSubviews:YES];
    
    NSTabViewItem *item;
    item = [[self gamesTabController] tabViewItemAtIndex:0];
    [item setView:storeGamesList];
    
    item = [[self gamesTabController] tabViewItemAtIndex:1];
    [item setView:storeGamesGrid];
    
    item = [[self gamesTabController] tabViewItemAtIndex:2];
    [item setView:self.storeMainGridView];
    
    [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:2]];
    
    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
    mainWindow.delegate = self;
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
    if(sender == 2 || sender == 3 || sender == 4) {
        [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:2]];
        [self hideListGridButtons:YES];
    } else {
        [self hideListGridButtons:NO];
    }
    self.storeCategoriesTitle.stringValue = title;
}

-(void)hideListGridButtons:(BOOL)hidden {
    [self.view setWantsLayer:YES];
    self.listImageView.hidden = hidden;
    self.gridImageView.hidden = hidden;
    if(hidden)
        self.buyXenioButtonConstraint.constant = kHideListGridButtons;
    else
        self.buyXenioButtonConstraint.constant = kShowListGridButtons;
    [self.view updateConstraints];
}

//-(void)windowDidResize:(NSNotification *)notification {
//    [self.storeMainGridView setWantsBestResolutionOpenGLSurface:YES];
//    [self.storeMainGridView setWantsLayer:YES];
//    NSSize defaultSize = NSMakeSize(1134, 594);
//    NSSize currentSize = self.gamesTabController.frame.size;
//
//    CGFloat liveW = currentSize.width / defaultSize.width;
//    CGFloat liveH = currentSize.height / defaultSize.height;
//
//    self.storeMainGridView.translatesAutoresizingMaskIntoConstraints = YES;
//    self.view.translatesAutoresizingMaskIntoConstraints = YES;
//    self.gamesTabController.translatesAutoresizingMaskIntoConstraints = YES;
//
//    [NSAnimationContext beginGrouping];
//    [[NSAnimationContext currentContext] setDuration:0.5];
//    self.storeMainGridView.animator.frame = CGRectMake(self.gamesTabController.frame.origin.x,
//                                                       self.gamesTabController.frame.origin.y,
//                                                       defaultSize.width * liveW,
//                                                       defaultSize.height * liveH);
//    self.storeMainGridView.translatesAutoresizingMaskIntoConstraints = YES;
//    self.view.translatesAutoresizingMaskIntoConstraints = YES;
//    [self.view setNeedsDisplay:YES];
//    [self.gamesTabController setNeedsDisplay:YES];
//    [NSAnimationContext endGrouping];
//}

-(void)windowWillStartLiveResize:(NSNotification *)notification {
    if(self.gamesTabController.inLiveResize) {
        NSLog(@"Resize: %@", notification.object);
        [self.storeMainGridView.layer setMasksToBounds:YES];
        [self.storeMainGridView setNeedsDisplay:YES];
        [self.view setNeedsUpdateConstraints:YES];
        [self.view setNeedsDisplay:YES];
    }
}

@end
