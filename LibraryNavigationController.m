//
//  LibraryNavigationController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryNavigationController.h"
#import <BFNavigationController/BFNavigationController.h>
#import "LibraryViewController.h"

@interface LibraryNavigationController () {
    BFNavigationController *_navigationController;
}

@end

@implementation LibraryNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Library" bundle:nil];
    LibraryViewController *mainLibraryVC = (LibraryViewController *)[sb instantiateControllerWithIdentifier:@"LibraryNavigationViewController"];
    
    _navigationController = [[BFNavigationController alloc] initWithFrame:NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                       rootViewController:mainLibraryVC];
    
    [self.view addSubview:_navigationController.view];
}

@end
