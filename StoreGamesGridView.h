#import "NSView+INSNibLoading.h"
#import "StoreGamesGridCell.h"

@interface StoreGamesGridView : INSNibLoadedView
@property (strong) NSArray *contents;
@property (strong) StoreGamesGridCell *collectionViewItem;
@property (strong) IBOutlet NSCollectionView *collectionView;
@end
