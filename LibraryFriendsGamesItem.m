#import "LibraryFriendsGamesItem.h"

@interface LibraryFriendsGamesItem ()

@property (strong) IBOutlet NSImageView *itemImageView;


@end

@implementation LibraryFriendsGamesItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    if(representedObject != nil) {
        [self.itemImageView setImage:[NSImage imageNamed:[representedObject valueForKey:@"itemImage"]]];
        [self.itemImageView setWantsLayer: YES];
        [self.itemImageView.layer setCornerRadius:self.itemImageView.frame.size.height/2];
        self.itemImageView.layer.masksToBounds = YES;
    }
}

@end
