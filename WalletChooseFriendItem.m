
#import "WalletChooseFriendItem.h"

@interface WalletChooseFriendItem ()

@end

@implementation WalletChooseFriendItem

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
        [self.itemImageView setWantsLayer: YES];
        [self.itemImageView.layer setCornerRadius:self.itemImageView.frame.size.height/2];
        self.itemImageView.layer.masksToBounds = YES;
        self.viewTag = [[representedObject valueForKey:@"itemTag"] integerValue];
        [self.itemSelectedIndicator setHidden:YES];
    }
}

-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if(selected)
        self.itemSelectedIndicator.hidden = NO;
    else
        self.itemSelectedIndicator.hidden = YES;
}

@end
