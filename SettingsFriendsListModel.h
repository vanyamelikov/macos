//
//  SettingsFriendsListModel.h
//  XenioUIKit
//
//  Created by Иван Меликов on 01.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendsListModel.h"

@interface SettingsFriendsListModel : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSArray<FriendsListModel *> *friends;

@end
