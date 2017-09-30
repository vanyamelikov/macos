#import "NSView+INSNibLoading.h"

@interface LibraryGamesServersListView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@end
