//
//  LibraryScreenshotsView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "LibraryScreenshotItem.h"

@interface LibraryScreenshotsView : INSNibLoadedView

@property (strong) NSArray *contents;
@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) LibraryScreenshotItem *collectionViewItem;

@end
