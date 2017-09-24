//
//  FriendsFeaturedGamesView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "FriendsFeaturedGamesItem.h"

@interface FriendsFeaturedGamesView : INSNibLoadedView
@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) NSArray *contents;
@property (strong) FriendsFeaturedGamesItem *collectionViewItem;
@end
