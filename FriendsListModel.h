//
//  FriendsListModel.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 26.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface FriendsListModel : INSNibLoadedView

@property (nonatomic) NSString *title;
@property (nonatomic) BOOL isHeader;

@end
