//
//  WalletChooseFriendCollectionView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WalletChooseFriendCollectionView.h"

@implementation WalletChooseFriendCollectionView

-(void)awakeFromNib {
    [super awakeFromNib];
    
}

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
    self.collectionView.delegate = self;
    self.collectionViewItem = [WalletChooseFriendItem new];
    
    self.contents = @[@{@"itemImage":@"img_cf_a1"},
                      @{@"itemImage":@"img_cf_a1"},
                      @{@"itemImage":@"img_cf_a1"},
                      @{@"itemImage":@"img_cf_a1"},
                      @{@"itemImage":@"img_cf_a1"},
                      @{@"itemImage":@"img_cf_a1"},
                      @{@"itemImage":@"img_cf_a1"},
                      @{@"itemImage":@"img_cf_a1"},
                      @{@"itemImage":@"img_cf_a1"}];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}



@end
