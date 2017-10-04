//
//  BuyGamePaymentMethodView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@class BuyGamePaymentMethodView;
@protocol BuyGamePaymentMethodViewDelegate <NSObject>
-(void)continueToLastPage;
@end

@interface BuyGamePaymentMethodView : INSNibLoadedView
@property (nonatomic, weak) id<BuyGamePaymentMethodViewDelegate> delegate;
@end
