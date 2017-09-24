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
@property (strong) IBOutlet NSBox *itemImageBox;

@end

@implementation FriendsFeaturedGamesItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
        [self.itemNameLabel setStringValue:[representedObject valueForKey:@"itemName"]];
    }
}

@end
