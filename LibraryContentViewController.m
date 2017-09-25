//
//  LibraryContentViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryContentViewController.h"

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

@end
