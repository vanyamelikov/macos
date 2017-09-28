//
//  StoreGamesGridCell.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreGamesGridCell.h"

@interface StoreGamesGridCell ()

@property (strong) IBOutlet NSImageView *itemImageView;
@property (strong) IBOutlet NSBox *itemRatingBox;
@property (strong) IBOutlet NSTextField *itemNameLabel;

@end

@implementation StoreGamesGridCell

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
        [self.itemImageView setWantsLayer: YES];
        [self.itemImageView.layer setCornerRadius:2.0f];
        self.itemImageView.layer.masksToBounds = YES;
        
        [self.itemNameLabel setStringValue:[representedObject valueForKey:@"itemName"]];
        
    }
}

@end
