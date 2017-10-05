//
//  ChatMessageModel.h
//  XenioUIKit
//
//  Created by Иван Меликов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatMessageModel : NSObject
@property (nonatomic) NSString *messageText;
@property (nonatomic) BOOL isIncomeMessage;
@end
