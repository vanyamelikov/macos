
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
                      @{@"itemImage":@"img_featured_dota", @"itemName":@"Dota 2"},
                      @{@"itemImage":@"img_featured_nfs", @"itemName":@"NFS MW 2"},
                      @{@"itemImage":@"img_featured_cod", @"itemName":@"COD 2"},
                      @{@"itemImage":@"img_featured_crew", @"itemName":@"The Crew"},
                      @{@"itemImage":@"img_featured_sam", @"itemName":@"Serious Sam"},
                      @{@"itemImage":@"img_featured_csgo", @"itemName":@"Cs Go"},
                      @{@"itemImage":@"img_featured_wot", @"itemName":@"WOT"},
                      @{@"itemImage":@"img_featured_assassin", @"itemName":@"Assassin`s"}
                      ];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
