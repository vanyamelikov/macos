//
//  WalletChooseFriendCollectionView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "WalletChooseFriendItem.h"

@interface WalletChooseFriendCollectionView : INSNibLoadedView <NSCollectionViewDelegate>

@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) NSArray *contents;
@property (strong) WalletChooseFriendItem *collectionViewItem;

@end
