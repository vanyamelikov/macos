//
//  FriendsListSearchBar.m
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FriendsListSearchBar.h"

@implementation FriendsListSearchBar{
    NSRect searchIVStartFrame;
    NSRect underlineBoxStartFrame;
    BOOL isActive;
}

- (instancetype) initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    
    if(self) {
        [self initView];
    }
    return self;
}

- (instancetype) initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame: frameRect];
    
    if(self) {
        [self initView];
    }
    return self;
}

- (void) awakeFromNib{
    [super awakeFromNib];
    [self initView];
}

- (void) initView{
    [self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
    searchIVStartFrame = self.searchIV.frame;
    underlineBoxStartFrame = self.underlineBox.frame;
    self.searchIV.hidden = NO;
    self.underlineBox.alphaValue = 0.0f;
    self.lightLayerIV.alphaValue = 1.0f;
    self.searchTF.hidden = YES;
    [self.searchIV setWantsLayer:YES];
    [self.currentOnlineLabel setWantsLayer:YES];
    [self.addFriendIV setWantsLayer:YES];
    [self.underlineBox setWantsLayer:YES];
    [self.searchTF setWantsLayer:YES];
    [self.searchTitle setWantsLayer:YES];
    self.searchTF.delegate = self;
}

- (IBAction)searchButtonClick:(NSClickGestureRecognizer *)sender {
    [self showSearcTextField];
}

- (void) animateSearchView{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.5f;
        context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        if(!isActive){
            self.searchIV.animator.frame = CGRectMake(20, self.searchIV.frame.origin.y, self.searchIV.frame.size.width, self.searchIV.frame.size.height);
            self.underlineBox.animator.alphaValue = 1.0f;
            self.underlineBox.animator.frame = CGRectMake(20, 0, self.frame.size.width-20, self.underlineBox.frame.size.height);
            self.lightLayerIV.animator.alphaValue = 0.0f;
            [self.searchTF becomeFirstResponder];
            isActive = YES;
        } else {
            self.searchIV.animator.frame = searchIVStartFrame;
            self.underlineBox.animator.frame = underlineBoxStartFrame;
            self.underlineBox.animator.alphaValue = 0.0f;
            self.lightLayerIV.animator.alphaValue = 1.0f;
            isActive = NO;
        }
    } completionHandler:^{
        
    }];
}

-(void)showSearcTextField {
    if(!isActive){
        self.searchTitle.hidden = YES;
        self.currentOnlineLabel.hidden = YES;
        self.addFriendIV.hidden = YES;
        self.lightLayerIV.hidden = YES;
        self.searchTF.hidden = NO;
        [self.searchIV setNeedsDisplay:YES];
        [self.currentOnlineLabel setNeedsDisplay:YES];
        [self.addFriendIV setNeedsDisplay:YES];
        [self.searchTitle setNeedsDisplay:YES];
        [self.underlineBox setNeedsDisplay:YES];
        [self animateSearchView];
    } else {
        self.searchTitle.hidden = NO;
        self.currentOnlineLabel.hidden = NO;
        self.addFriendIV.hidden = NO;
        self.lightLayerIV.hidden = NO;
        self.searchTF.hidden = YES;
        [self.searchIV setNeedsDisplay:YES];
        [self animateSearchView];
    }
}

@end
