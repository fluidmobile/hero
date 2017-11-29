//
//  HEROBaseViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 17/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "HEROBaseViewController.h"
#import "HEROBaseCoordinator.h"

@interface HEROBaseViewController ()
@end

@implementation HEROBaseViewController
- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.edgesForExtendedLayout = UIRectEdgeNone;
	self.title = [[self.class description] stringByReplacingOccurrencesOfString:@"ViewController" withString:@""];
    return self;
}

- (void)viewDidLoad{
	[super viewDidLoad];
	[self requestContentUpdate];
}

- (void)requestContentUpdate{
	[self.coordinator requestContentUpdate];
}

@end
