//
//  BuyGameQRView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@class BuyGameQRView;

@protocol BuyGameQRViewDelegate <NSObject>
-(void)continueToPaymentInfo;
@end

@interface BuyGameQRView : INSNibLoadedView
@property (nonatomic, weak) id <BuyGameQRViewDelegate> delegate;
@end
