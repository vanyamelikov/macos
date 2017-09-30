#import "NSView+INSNibLoading.h"
#import "LibraryScreenshotItem.h"

@interface LibraryScreenshotsView : INSNibLoadedView

@property (strong) NSArray *contents;
@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) LibraryScreenshotItem *collectionViewItem;

@end
