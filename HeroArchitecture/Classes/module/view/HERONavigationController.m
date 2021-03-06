//
//  LORENavigationController.m
//  loreical
//
//  Created by Thomas on 03.07.18.
//  Copyright © 2018 fluidmobile GmbH. All rights reserved.
//

#import "HERONavigationController.h"
#import "HEROBaseCoordinator.h"

@interface HERONavigationController ()
@end

@implementation HERONavigationController
@synthesize coordinator;

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = [[self.class description] stringByReplacingOccurrencesOfString:@"ViewController" withString:@""];
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestContentUpdate];
}

- (void)requestContentUpdate{
    [self.coordinator requestContentUpdate];
}

- (BOOL)prefersStatusBarHidden{
    return [self.viewControllers lastObject].prefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.viewControllers lastObject].preferredStatusBarStyle;
}

@end
