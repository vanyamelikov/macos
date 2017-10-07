//
//  LibraryEmptyView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 01.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryEmptyView.h"

@implementation LibraryEmptyView

@synthesize addGameDelegate;

-(void)awakeFromNib {
    [super awakeFromNib];
}
- (IBAction)showLibraryGameViewClick:(NSClickGestureRecognizer *)sender {
    if(addGameDelegate && [self.addGameDelegate respondsToSelector:@selector(libraryEmtyAddGameClick)]) {
        [self.addGameDelegate libraryEmtyAddGameClick];
    }
}

- (IBAction)backAction:(NSClickGestureRecognizer *)sender {
    
}

@end
