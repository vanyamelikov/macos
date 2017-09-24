//
//  LibraryScreenshotItem.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryScreenshotItem.h"

@interface LibraryScreenshotItem ()
@property (strong) IBOutlet NSImageView *itemImageView;
@property (nonatomic) id representItem;
@end

@implementation LibraryScreenshotItem

-(instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        self.representItem = representedObject;
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
    }
}

-(void)mouseDown:(NSEvent *)event {
    if(self.representItem)
        NSLog(@"Clicked - %@", self.representItem);
}

@end
