//
//  LibraryFriendsGamesItem.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryFriendsGamesItem.h"

@interface LibraryFriendsGamesItem ()

@property (strong) IBOutlet NSImageView *itemImageView;


@end

@implementation LibraryFriendsGamesItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
    }
}

@end
