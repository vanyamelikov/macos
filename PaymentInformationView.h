//
//  PaymentInformationView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@class PaymentInformationView;

@protocol PaymentInformationViewDelegate <NSObject>
-(void)openMainStoreViewController;
@end

@interface PaymentInformationView : INSNibLoadedView
@property (nonatomic, weak) id<PaymentInformationViewDelegate> delegate;
@end
