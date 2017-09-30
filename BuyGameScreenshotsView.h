#import "NSView+INSNibLoading.h"
#import "BuyGameScreenshotItem.h"

@interface BuyGameScreenshotsView : INSNibLoadedView
@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) NSArray *contents;
@property (strong) BuyGameScreenshotItem *collectionViewItem;
@end
