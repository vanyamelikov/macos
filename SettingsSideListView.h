#import "NSView+INSNibLoading.h"

@interface SettingsSideListView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@end
