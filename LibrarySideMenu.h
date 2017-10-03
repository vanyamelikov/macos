#import "NSView+INSNibLoading.h"


@interface LibrarySideMenu : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource, NSPopoverDelegate>

@property (strong) IBOutlet NSTableView *tableView;

@end
