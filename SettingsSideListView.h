#import "NSView+INSNibLoading.h"

@interface SettingsSideListView : INSNibLoadedView <NSOutlineViewDelegate, NSOutlineViewDataSource>

@property (weak) IBOutlet NSOutlineView *friendsOutlineView;

@end
