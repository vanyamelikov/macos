
#import "NSView+INSNibLoading.h"
#import "FriendsFeaturedGamesItem.h"

@interface FriendsFeaturedGamesView : INSNibLoadedView
@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) NSArray *contents;
@property (strong) FriendsFeaturedGamesItem *collectionViewItem;
@end
