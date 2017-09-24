//
//  LibraryScreenshotsView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryScreenshotsView.h"

@implementation LibraryScreenshotsView

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
    self.collectionViewItem = [LibraryScreenshotItem new];
    
    self.contents = @[@{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"},
                      @{@"itemImage":@"screenshot"}];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
