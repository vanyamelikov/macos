#import "NSView+INSNibLoading.h"

@interface SettingsNavigationListView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@end
