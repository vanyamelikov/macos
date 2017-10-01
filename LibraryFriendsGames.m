#import "LibraryFriendsGames.h"

@implementation LibraryFriendsGames


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
    self.collectionViewItem = [LibraryFriendsGamesItem new];
    
    self.contents = @[@{@"itemImage":@"library_friends_1"},
                      @{@"itemImage":@"library_friends_2"},
                      @{@"itemImage":@"library_friends_3"},
                      @{@"itemImage":@"library_friends_4"},
                      @{@"itemImage":@"library_friends_5"},
                      @{@"itemImage":@"library_friends_6"},
                      @{@"itemImage":@"library_friends_7"},
                      @{@"itemImage":@"library_friends_8"},
                      @{@"itemImage":@"library_friends_9"},
                      @{@"itemImage":@"library_friends_3"},
                      @{@"itemImage":@"library_friends_6"},
                      @{@"itemImage":@"library_friends_2"},
                      @{@"itemImage":@"library_friends_8"},
                      @{@"itemImage":@"library_friends_1"},
                      @{@"itemImage":@"library_friends_9"},
                      @{@"itemImage":@"library_friends_4"},
                      @{@"itemImage":@"library_friends_2"},
                      @{@"itemImage":@"library_friends_5"},
                      @{@"itemImage":@"library_friends_8"},
                      @{@"itemImage":@"library_friends_6"},
                      @{@"itemImage":@"library_friends_3"}];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
