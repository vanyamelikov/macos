//
//  StoreGamesViewModel.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreGamesViewModel : NSObject

@property (nonatomic) NSString *gameName;
@property (nonatomic) NSImage *gameImage;
@property (nonatomic) CGFloat gameRating;
@property (nonatomic) NSInteger gameOSType;
@property (nonatomic) NSInteger buttonType;
@property (nonatomic) NSString *gamePrice;
@end
