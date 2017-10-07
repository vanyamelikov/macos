//
//  WalletAddressModalViewController.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WalletAddressModalViewController.h"

@interface WalletAddressModalViewController ()

@end

@implementation WalletAddressModalViewController

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)copyClick:(NSClickGestureRecognizer *)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(copyAddressValue)]) {
        [self.delegate copyAddressValue];
    }

}
- (IBAction)pasteClick:(NSClickGestureRecognizer *)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(pasteAddressValue)]) {
        [self.delegate pasteAddressValue];
    }
}

@end
