//
//  PGameInfoController.m
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "PGameInfoController.h"
#import "BFNavigationController.h"
#import "NSViewController+BFNavigationController.h"

@interface PGameInfoController ()

@end

@implementation PGameInfoController

- (id)initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        // Initialization code here.
    }
    
    return self;
}
- (IBAction)backActionClick:(NSClickGestureRecognizer *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadView {
    [super loadView];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@ - viewWillAppear: %i", self.title, animated);
//    NSClickGestureRecognizer *registerClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(RegisterAction:)];
//    [self.RegisterLabel addGestureRecognizer:registerClick];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@ - viewDidAppear: %i", self.title, animated);
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%@ - viewWillDisappear: %i", self.title, animated);
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%@ - viewDidDisappear: %i", self.title, animated);
}
@end
