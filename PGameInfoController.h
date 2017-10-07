//
//  PGameInfoController.h
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BFViewController.h"
#import "BuyGameMainView.h"
#import "StoreGameInfoView.h"
#import "StorePurchaseListView.h"
#import "BuyGameQRView.h"
#import "BuyGamePaymentMethodView.h"
#import "PaymentInformationView.h"

@interface PGameInfoController : NSViewController <BFViewController, StorePurchaseListViewDelegate, BuyGameMainViewDelegate, BuyGameQRViewDelegate, BuyGamePaymentMethodViewDelegate, PaymentInformationViewDelegate>

@property (weak) IBOutlet BuyGameMainView *buyGameMainView;
@property (weak) IBOutlet StoreGameInfoView *storeGameInfoView;
@property (weak) IBOutlet StorePurchaseListView *storePurchaseListView;
@property (weak) IBOutlet BuyGameQRView *buyGameQrView;
@property (weak) IBOutlet BuyGamePaymentMethodView *paymentMethodView;
@property (weak) IBOutlet PaymentInformationView *paymentInformationView;


@end
