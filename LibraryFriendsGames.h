#import "NSView+INSNibLoading.h"
#import "LibraryFriendsGamesItem.h"

@interface LibraryFriendsGames : INSNibLoadedView
@property (strong) NSArray *contents;
@property (strong) IBOutlet NSCollectionView *collectionView;
@property (strong) LibraryFriendsGamesItem *collectionViewItem;
@end
