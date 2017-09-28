//
//  LibraryContentViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryContentViewController.h"
#import "LibraryEmptySideMenu.h"
#import "SplitViewWithDivider.h"
#import "MainWindow.h"

@interface LibraryContentViewController ()

@end

@implementation LibraryContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.libraryGameView.hidden = YES;
    self.libraryEmptyView.hidden = NO;
    
    NSClickGestureRecognizer *addGameClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(addGameAction:)];
    [self.addGameButton addGestureRecognizer:addGameClick];
}

-(void)viewWillAppear {
    [super viewWillAppear];
//    SplitViewWithDivider *splitViewController = (SplitViewWithDivider*)self.view.superview.superview;
//    NSTabView *vc = (NSTabView *)splitViewController.superview.superview;
//    NSView *view1 = [vc.tabViewItems[0] view];
//    NSImage *img = [self imageRepresentation:view1];
//
//    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
//    [mainWindow changeBackgroundImage:img];
//    [mainWindow setMovableByWindowBackground:YES];
}

- (void)addGameAction:(id)sender
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.libraryEmptyView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.libraryEmptyView.hidden = YES;
                            self.libraryGameView.hidden = NO;
                            self.libraryEmptyView.alphaValue = 1;
                        }];
    
}

- (NSImage *)imageRepresentation :(NSView *)viewToImage
{
    BOOL wasHidden = viewToImage.isHidden;
    CGFloat wantedLayer = viewToImage.wantsLayer;
    
    viewToImage.hidden = NO;
    viewToImage.wantsLayer = YES;
    
    NSImage *image = [[NSImage alloc] initWithSize:viewToImage.bounds.size];
    [image lockFocus];
    CGContextRef ctx = [NSGraphicsContext currentContext].graphicsPort;
    [viewToImage.layer renderInContext:ctx];
    [image unlockFocus];
    
    viewToImage.wantsLayer = wantedLayer;
    viewToImage.hidden = wasHidden;
    
    return image;
}

@end
