//
//  ReceiveView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ReceiveView.h"


@implementation ReceiveView {
    NSPopover *popover;
    WalletAddressModalViewController *popoverViewController;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    popoverViewController.delegate = self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}
- (IBAction)openPopupCopyPaste:(NSClickGestureRecognizer *)sender {
    //WalletAddressModalViewController
    popover = [[NSPopover alloc] init];
    [popover setBehavior: NSPopoverBehaviorTransient];
    [popover setDelegate: self];
    popoverViewController = [[WalletAddressModalViewController alloc] initWithNibName: @"WalletAddressModalViewController" bundle: nil];
    [popover setContentViewController: popoverViewController];
    [popover setContentSize: popoverViewController.view.frame.size];
    [popover showRelativeToRect: sender.view.bounds
                         ofView: sender.view
                  preferredEdge: NSMaxYEdge | NSMaxXEdge];
}



- (void)copyAddressValue {
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:self.addressLabel.stringValue forType:NSStringPboardType];
}

@end
