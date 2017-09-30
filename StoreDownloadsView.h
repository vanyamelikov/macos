#import "NSView+INSNibLoading.h"

@interface StoreDownloadsView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@end
