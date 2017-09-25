//
//  SettingsNavigationViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SettingsNavigationViewController.h"
#import <BFNavigationController/BFNavigationController.h>
#import "SettingsViewController.h"

@interface SettingsNavigationViewController () {
    BFNavigationController *_navigationController;
}

@end

@implementation SettingsNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Settings" bundle:nil];
    SettingsViewController *mainStoreVC = (SettingsViewController *)[sb instantiateControllerWithIdentifier:@"SettingsNavigationController"];
    _navigationController = [[BFNavigationController alloc] initWithFrame:NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                       rootViewController:mainStoreVC];
    
    [self.view addSubview:_navigationController.view];
}

@end
