//
//  LORENavigationController.m
//  loreical
//
//  Created by Thomas on 03.07.18.
//  Copyright © 2018 fluidmobile GmbH. All rights reserved.
//

#import "HERONavigationController.h"

@interface HERONavigationController ()

@end

@implementation HERONavigationController

- (BOOL)prefersStatusBarHidden{
    return [self.viewControllers lastObject].prefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.viewControllers lastObject].preferredStatusBarStyle;
}
@end
