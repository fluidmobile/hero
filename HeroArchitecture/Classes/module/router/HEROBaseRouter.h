//
//  HEROBaseRouter.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 16/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "HEROBaseRouterInterface.h"
@import UIKit;
@class HEROBaseCoordinator, HEROBaseTransition, HEROBaseWorkflow;

@interface HEROBaseRouter : NSObject <HEROBaseRouterInterface>
@property (nonatomic, weak) HEROBaseWorkflow* workflow;
@property (nonatomic, weak) HEROBaseCoordinator* coordinator;
@property (nonatomic, weak) UIViewController* viewLayer;
@property (nonatomic, assign) BOOL hasNavigationInTabBar;


- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflow:(HEROBaseWorkflow*)workflow;

- (void)pushOnRouter:(HEROBaseRouter*)router;

- (void)presentOnWindow:(UIWindow*)window withNavigation:(BOOL)hasNavigation;
- (void)presentOnRouter:(HEROBaseRouter*)router inNavigationController:(BOOL)inNavigationController setAsRootView:(BOOL)setAsRootView transition:(HEROBaseTransition*)transition;

- (void)exposeRouter;
@end
