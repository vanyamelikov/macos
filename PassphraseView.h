//
//  PassphraseView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "ContinueButton.h"

@class PassphraseView;
@protocol PassphraseViewDelegate <NSObject>
-(void)passphraseViewDismiss;
@end

@interface PassphraseView : INSNibLoadedView

@property (strong) IBOutlet ContinueButton *continueButton;
@property (strong) IBOutlet NSImageView *closeButton;

@property (nonatomic, weak) id <PassphraseViewDelegate> delegate;

@end
