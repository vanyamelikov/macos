#import <Foundation/Foundation.h>

@interface StoreGamesViewModel : NSObject

@property (nonatomic) NSString *gameName;
@property (nonatomic) NSImage *gameImage;
@property (nonatomic) CGFloat gameRating;
@property (nonatomic) NSInteger gameOSType;
@property (nonatomic) NSInteger buttonType;
@property (nonatomic) NSString *gamePrice;
@end
