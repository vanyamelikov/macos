#import "NSView+INSNibLoading.h"

@interface LibraryGamesRightMenuView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>
@property (strong) IBOutlet NSTableView *tableView;

@end
