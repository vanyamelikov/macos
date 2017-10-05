//
//  FriendsFeaturedGamesItem.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FriendsFeaturedGamesItem.h"

@interface FriendsFeaturedGamesItem ()
@property (strong) IBOutlet NSImageView *itemImageView;
@property (strong) IBOutlet NSTextField *itemNameLabel;

@end

@implementation FriendsFeaturedGamesItem

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        [self.itemImageView setWantsLayer:YES];
        [self.itemImageView.layer setCornerRadius:10.0f];
        [self.itemImageView.layer setMasksToBounds:YES];
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
        [self.itemNameLabel setStringValue:[representedObject valueForKey:@"itemName"]];
    }
}

@end
