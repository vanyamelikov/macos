#import "NSView+INSNibLoading.h"

@interface StoreGamesView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@end
