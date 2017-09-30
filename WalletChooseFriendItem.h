
#import <Cocoa/Cocoa.h>

@interface WalletChooseFriendItem : NSCollectionViewItem

@property (strong) IBOutlet NSImageView *itemImageView;
@property (strong) IBOutlet NSBox *itemSelectedIndicator;
@property (nonatomic) NSInteger viewTag;

@end
