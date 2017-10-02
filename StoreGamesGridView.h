#import "NSView+INSNibLoading.h"
#import "StoreGamesGridCell.h"

@class StoreGamesGridViewDelegate;
@protocol StoreGamesGridViewDelegate <NSObject>
-(void)gamesGridViewItemClicked:(id)item;
@end

@interface StoreGamesGridView : INSNibLoadedView <NSCollectionViewDelegate>

@property (strong) NSArray *contents;
@property (strong) StoreGamesGridCell *collectionViewItem;
@property (strong) IBOutlet NSCollectionView *collectionView;

@property (nonatomic, weak) id <StoreGamesGridViewDelegate> delegate;

@end
