//
//  ProfileModel.h
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileModel : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *lastActivityTime;
@property (nonatomic) NSString *totalTime;
@property (nonatomic) NSImage *gameImage;

@end
