//
//  WalletChooseFriendItem.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WalletChooseFriendItem : NSCollectionViewItem

@property (strong) IBOutlet NSImageView *itemImageView;
@property (strong) IBOutlet NSBox *itemSelectedIndicator;
@property (nonatomic) NSInteger viewTag;

@end
