//
//  StoreGamesGridView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "StoreGamesGridCell.h"

@interface StoreGamesGridView : INSNibLoadedView <NSCollectionViewDelegate>
@property (strong) NSArray *contents;
@property (strong) StoreGamesGridCell *collectionViewItem;
@property (strong) IBOutlet NSCollectionView *collectionView;
@end
