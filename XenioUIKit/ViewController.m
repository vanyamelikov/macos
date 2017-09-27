//
//  ViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 11.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ViewController.h"
#import "SignInViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSClickGestureRecognizer *continueClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(continueClicked:)];
    [self.continueButton addGestureRecognizer:continueClick];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)continueClicked:(id)sender
{
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    SignInViewController *vc1 = (SignInViewController*)[sb instantiateControllerWithIdentifier:@"SignInViewController"];
    self.view.window.contentViewController = vc1;
}

@end
