#import "LibraryScreenshotItem.h"

@interface LibraryScreenshotItem ()
@property (strong) IBOutlet NSImageView *itemImageView;
@end

@implementation LibraryScreenshotItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
    }
}

@end
