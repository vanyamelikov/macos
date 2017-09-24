//
//  WalletChooseFriendItem.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WalletChooseFriendItem.h"

@interface WalletChooseFriendItem ()

@property (strong) IBOutlet NSImageView *itemImageView;
@property (strong) IBOutlet NSBox *itemSelectedIndicator;

@end

@implementation WalletChooseFriendItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
        [self.itemImageView setWantsLayer: YES];
        [self.itemImageView.layer setCornerRadius:self.itemImageView.frame.size.height/2];
        self.itemImageView.layer.masksToBounds = YES;
    }
}

@end
