//
//  BuyGameScreenshotsView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "BuyGameScreenshotItem.h"

@interface BuyGameScreenshotsView : INSNibLoadedView
@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) NSArray *contents;
@property (strong) BuyGameScreenshotItem *collectionViewItem;
@end
