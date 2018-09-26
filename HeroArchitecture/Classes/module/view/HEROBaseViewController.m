//
//  HEROBaseViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 17/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "HEROBaseViewController.h"
#import "HEROBaseCoordinator.h"
#import "HEROBaseView.h"

@interface HEROBaseViewController ()
@end

@implementation HEROBaseViewController
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
@end
