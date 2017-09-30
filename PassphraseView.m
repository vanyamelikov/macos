//
//  PassphraseView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "PassphraseView.h"
#import "NSPopover+MISSINGBackgroundView.h"
#import "MainStoreViewController.h"

@implementation PassphraseView {
    NSArray *wordsArray;
}

@synthesize delegate;

-(void)awakeFromNib {
    [super awakeFromNib];
    NSString *splitedString = @"Mother,Passion,Smile,Love,Eternity,Fantastic,Destiny,Freedom,Liberty,Peace,Blossom,Sunshine,Sweetheart,Gorgeous,Cherish,Enthusiasm,Hope,Grace,Rainbow,Blue,Sunflower,Twinkle,Serendipity,Bliss,Lullaby,Sophisticated,Renaissance,Cute ,Cosy,Butterfly,Galaxy,Hilarious,Moment,Extravaganza,Aqua,Sentiment,Cosmopolitan,Bubble,Pumpkin,Banana,Lollipop,If,Bumblebee,Giggle,Paradox,Delicacy,Peekaboo,Umbrella,Kangaroo";
    wordsArray = [splitedString componentsSeparatedByString:@","];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSClickGestureRecognizer *close = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(closeClicked:)];
    [self.closeButton addGestureRecognizer:close];
    
    NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(closeClicked:)];
    [self.continueButton addGestureRecognizer:click];
}

- (void)closeClicked:(id)sender
{
    if(delegate && [self.delegate respondsToSelector:@selector(passphraseViewDismiss)])
       [self.delegate passphraseViewDismiss];
}
- (IBAction)randomWordGeneratorClick:(NSClickGestureRecognizer *)sender {    
    NSMutableSet *wordsSet = [[NSMutableSet alloc] initWithCapacity:12];
    while ([wordsSet count] < 12)
        [wordsSet addObject:[wordsArray objectAtIndex:[self getRandomNumberBetween:0 to:(int)(wordsArray.count - 1)]]];
    
    self.phraseLabel.stringValue = [[[wordsSet allObjects] componentsJoinedByString:@" "] lowercaseString];
}

- (IBAction)copyToClipboardClick:(id)sender {
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:self.phraseLabel.stringValue forType:NSStringPboardType];
}


-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

@end
