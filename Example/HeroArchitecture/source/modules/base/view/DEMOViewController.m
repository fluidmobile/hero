//
//  DEMOViewController.m
//  HeroArchitecture_Example
//
//  Created by Moritz Ellerbrock on 12.07.18.
//  Copyright © 2018 fluidmobile GmbH. All rights reserved.
//

#import "DEMOViewController.h"
#import <FLEX/FLEX.h>

@interface DEMOViewController ()

@end

@implementation DEMOViewController

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [super motionEnded:motion withEvent:event];
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] showExplorer];
    }
}

@end
