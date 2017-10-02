#import "NSView+INSNibLoading.h"

@class StoreGamesView;
@protocol StoreGamesViewDelegate <NSObject>
-(void)tableViewItemClicked:(id)item;
@end

@interface StoreGamesView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@property (nonatomic, weak) id <StoreGamesViewDelegate> delegate;

@end
