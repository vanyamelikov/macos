#import "StoreGamesGridView.h"

@implementation StoreGamesGridView

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
    self.collectionViewItem = [StoreGamesGridCell new];

    self.contents = @[@{@"itemImage":@"img_store_game1", @"itemName":@"The Witcher 3"},
                      @{@"itemImage":@"img_store_game2", @"itemName":@"Tom Clancy's The Devision"},
                      @{@"itemImage":@"img_store_game3", @"itemName":@"The Crew"},
                      @{@"itemImage":@"img_store_game4", @"itemName":@"Fallout 4"},
                      @{@"itemImage":@"img_store_game5", @"itemName":@"Crysis 2"},
                      @{@"itemImage":@"img_store_game6", @"itemName":@"Assassin's Creed Syndicate"},
                      @{@"itemImage":@"img_store_game7", @"itemName":@"Dirt Rally"},
                      @{@"itemImage":@"img_store_game8", @"itemName":@"Need For Speed Most Wanted 2"},
                      @{@"itemImage":@"img_store_game1", @"itemName":@"The Witcher 3"},
                      @{@"itemImage":@"img_store_game2", @"itemName":@"Tom Clancy's The Devision"},
                      @{@"itemImage":@"img_store_game3", @"itemName":@"The Crew"}];
    
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
    
    self.collectionView.delegate = self;
}

-(void)updateCollectionView : (BOOL)isAnimation {
    if(!isAnimation) {
        self.collectionViewItem = [StoreGamesGridCell new];
        
        self.contents = @[@{@"itemImage":@"img_store_game5", @"itemName":@"Crysis 2"},
                          @{@"itemImage":@"img_store_game1", @"itemName":@"The Witcher 3"},
                          @{@"itemImage":@"img_store_game6", @"itemName":@"Assassin's Creed Syndicate"},
                          @{@"itemImage":@"img_store_game2", @"itemName":@"Tom Clancy's The Devision"},
                          @{@"itemImage":@"img_store_game3", @"itemName":@"The Crew"},
                          @{@"itemImage":@"img_store_game4", @"itemName":@"Fallout 4"},
                          @{@"itemImage":@"img_store_game7", @"itemName":@"Dirt Rally"},
                          @{@"itemImage":@"img_store_game8", @"itemName":@"Need For Speed Most Wanted 2"},
                          @{@"itemImage":@"img_store_game1", @"itemName":@"The Witcher 3"},
                          @{@"itemImage":@"img_store_game3", @"itemName":@"The Crew"},
                          @{@"itemImage":@"img_store_game2", @"itemName":@"Tom Clancy's The Devision"}];
        
        [self.collectionView setItemPrototype:self.collectionViewItem];
        
        [self.collectionView setContent:self.contents];
        
        self.collectionView.delegate = self;
    }

    self.collectionView.alphaValue = 0;
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:1.5f];
    [self.collectionView.animator reloadData];
    self.collectionView.animator.alphaValue = 1;
    [NSAnimationContext endGrouping];
    self.collectionView.alphaValue = 1;
}

- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths {
    
}

@end
