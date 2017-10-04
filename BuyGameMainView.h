//
//  BuyGameMainView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@class BuyGameMainView;
@protocol BuyGameMainViewDelegate <NSObject>
- (void) preOrderClick;
@end

@interface BuyGameMainView : INSNibLoadedView

@property (nonatomic, weak) id <BuyGameMainViewDelegate> delegate;

@end
