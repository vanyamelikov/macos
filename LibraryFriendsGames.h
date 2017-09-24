//
//  LibraryFriendsGames.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "LibraryFriendsGamesItem.h"

@interface LibraryFriendsGames : INSNibLoadedView
@property (strong) NSArray *contents;
@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) LibraryFriendsGamesItem *collectionViewItem;
@end
