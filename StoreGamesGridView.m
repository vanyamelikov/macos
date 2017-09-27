//
//  StoreGamesGridView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreGamesGridView.h"

@implementation StoreGamesGridView

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
    self.collectionViewItem = [StoreGamesGridCell new];
    
    self.contents = @[@{@"itemImage":@"screenshot", @"itemName":@"Need For Speed Most Wanted"},
                      @{@"itemImage":@"screenshot", @"itemName":@"Fallout 4"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"Need For Speed Most Wanted"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"},
                      @{@"itemImage":@"screenshot", @"itemName":@"The Crew"}];
    
    //[self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
