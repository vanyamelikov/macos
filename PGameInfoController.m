//
//  PGameInfoController.m
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "PGameInfoController.h"
#import "BFNavigationController.h"
#import "NSViewController+BFNavigationController.h"

@interface PGameInfoController ()

@end

@implementation PGameInfoController

- (id)initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        //background_purchase
    }
    
    return self;
}
- (IBAction)backActionClick:(NSClickGestureRecognizer *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadView {
    [super loadView];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@ - viewWillAppear: %i", self.title, animated);
    self.storePurchaseListView.delegate = self;
    self.buyGameMainView.delegate = self;
    self.buyGameQrView.delegate = self;
    self.paymentMethodView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@ - viewDidAppear: %i", self.title, animated);
    [[NSNotificationCenter defaultCenter]
         postNotificationName:@"changeBackgroundNotification"
         object:@"background_purchase"];
    self.buyGameMainView.hidden = NO;
    self.storeGameInfoView.hidden = YES;
    self.buyGameQrView.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%@ - viewWillDisappear: %i", self.title, animated);
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%@ - viewDidDisappear: %i", self.title, animated);
}
- (void)itemClicked:(NSInteger)sender {
    if(sender == 0) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.5f];
        self.buyGameMainView.animator.hidden = NO;
        self.storeGameInfoView.animator.hidden = YES;
        self.buyGameQrView.animator.hidden = YES;
        [NSAnimationContext endGrouping];
    } else if(sender == 1) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.5f];
        self.buyGameMainView.animator.hidden = YES;
        self.storeGameInfoView.animator.hidden = NO;
        self.buyGameQrView.animator.hidden = YES;
        [NSAnimationContext endGrouping];
    } else {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.5f];
        self.buyGameMainView.animator.hidden = NO;
        self.storeGameInfoView.animator.hidden = YES;
        self.buyGameQrView.animator.hidden = YES;
        [NSAnimationContext endGrouping];
    }
}

- (void)preOrderClick {
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:1.5f];
    self.buyGameMainView.animator.hidden = YES;
    self.storeGameInfoView.animator.hidden = YES;
    self.storePurchaseListView.animator.hidden = YES;
    self.buyGameQrView.animator.hidden = NO;
    [NSAnimationContext endGrouping];
}

- (void)continueToPaymentInfo {
    
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:1.5f];
    self.buyGameMainView.animator.hidden = YES;
    self.storeGameInfoView.animator.hidden = YES;
    self.buyGameQrView.animator.hidden = YES;
    self.storePurchaseListView.animator.hidden = YES;
    self.paymentMethodView.animator.hidden = NO;
    [NSAnimationContext endGrouping];
}

- (void)continueToLastPage {
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:1.5f];
    self.paymentMethodView.animator.hidden = YES;
    self.paymentInformationView.animator.hidden = NO;
    [NSAnimationContext endGrouping];
}

@end
