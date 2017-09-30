
#import "NSView+INSNibLoading.h"

@interface FriendsContentList : INSNibLoadedView<NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@end
