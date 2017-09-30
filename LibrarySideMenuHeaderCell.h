#import "NSView+INSNibLoading.h"

@interface LibrarySideMenuHeaderCell : INSNibLoadedView

@property (strong) IBOutlet NSBox *backgroundBox;
@property (strong) IBOutlet NSTextField *label;
@property (strong) IBOutlet NSImageView *lightLayer;
@property (strong) IBOutlet NSImageView *searchImage;

@end
