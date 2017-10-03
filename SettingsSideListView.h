#import "NSView+INSNibLoading.h"
#import "CustomOutlineView.h"

@interface SettingsSideListView : INSNibLoadedView <NSOutlineViewDelegate, NSOutlineViewDataSource, NSPopoverDelegate>

@property (weak) IBOutlet CustomOutlineView *friendsOutlineView;


@end
