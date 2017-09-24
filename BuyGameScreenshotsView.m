//
//  BuyGameScreenshotsView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "BuyGameScreenshotsView.h"

@implementation BuyGameScreenshotsView

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        [self initView];
    }
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        [self initView];
    }
    return self;
}

-(void)initView {
    self.collectionViewItem = [BuyGameScreenshotItem new];
    
    self.contents = @[@{@"itemImage":@"screenshot1"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot1"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot1"},
                      @{@"itemImage":@"screenshot1"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot1"}];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
