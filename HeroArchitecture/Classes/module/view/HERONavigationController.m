//
//  LORENavigationController.m
//  loreical
//
//  Created by Thomas on 03.07.18.
//  Copyright © 2018 fluidmobile GmbH. All rights reserved.
//
#import "HERONavigationController.h"
#import "HEROBaseCoordinator.h"
#import "HEROBaseView.h"

@interface HERONavigationController ()
@end

@implementation HERONavigationController
@synthesize coordinator;
- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = [[self.class description] stringByReplacingOccurrencesOfString:@"ViewController" withString:@"VC"];
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self requestContentUpdate];
}

- (void)requestContentUpdate{
    [self.coordinator requestContentUpdate];
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    if ([self.view isKindOfClass:[HEROBaseView class]]){
        [((HEROBaseView*)self.view) updateSizeClass:self.traitCollection.horizontalSizeClass];
    }
    [self requestContentUpdate];
}

-(void)contentDidChange{
    NSAssert(NO, @"OVERRIDE: contentDidChange: in %@",[[self class] description]);
}

- (BOOL)prefersStatusBarHidden{
    return [self.viewControllers lastObject].prefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.viewControllers lastObject].preferredStatusBarStyle;
}
@end
