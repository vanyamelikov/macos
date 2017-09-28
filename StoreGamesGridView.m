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
    
    self.contents = @[@{@"itemImage":@"img_store_game1", @"itemName":@"The Witcher 3"},
                      @{@"itemImage":@"img_store_game2", @"itemName":@"Tom Clancy's The Devision"},
                      @{@"itemImage":@"img_store_game3", @"itemName":@"The Crew"},
                      @{@"itemImage":@"img_store_game4", @"itemName":@"Fallout 4"},
                      @{@"itemImage":@"img_store_game5", @"itemName":@"Crysis 2"},
                      @{@"itemImage":@"img_store_game6", @"itemName":@"Assassin's Creed Syndicate"},
                      @{@"itemImage":@"img_store_game7", @"itemName":@"Dirt Rally"},
                      @{@"itemImage":@"img_store_game8", @"itemName":@"Need For Speed Most Wanted 2"},
                      @{@"itemImage":@"img_store_game1", @"itemName":@"The Witcher 3"},
                      @{@"itemImage":@"img_store_game2", @"itemName":@"Tom Clancy's The Devision"},
                      @{@"itemImage":@"img_store_game3", @"itemName":@"The Crew"}];
    
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
