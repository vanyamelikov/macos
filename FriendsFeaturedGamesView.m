
#import "FriendsFeaturedGamesView.h"

@implementation FriendsFeaturedGamesView

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        [self initView];
    }
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        [self initView];
    }
    return self;
}

-(void)initView {
    self.collectionViewItem = [FriendsFeaturedGamesItem new];
    
    self.contents = @[
                      @{@"itemImage":@"featured_image_1", @"itemName":@"Shadow of..."},
                      @{@"itemImage":@"featured_image_2", @"itemName":@"Black Sea 2"},
                      @{@"itemImage":@"featured_image_3", @"itemName":@"Navy"},
                      @{@"itemImage":@"featured_image_4", @"itemName":@"Obizoniac"},
                      @{@"itemImage":@"featured_image_5", @"itemName":@"Colorite"},
                      @{@"itemImage":@"featured_image_6", @"itemName":@"Nobunaga"},
                      @{@"itemImage":@"featured_image_7", @"itemName":@"Crime scene"},
                      @{@"itemImage":@"featured_image_8", @"itemName":@"W.O.F.S"}
                      ];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
