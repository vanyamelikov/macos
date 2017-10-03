#import "NSView+INSNibLoading.h"
#import "CustomOutlineView.h"

@interface SettingsSideListView : INSNibLoadedView <NSOutlineViewDelegate, NSOutlineViewDataSource>

@property (weak) IBOutlet CustomOutlineView *friendsOutlineView;


@end
