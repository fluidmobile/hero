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

NS_ASSUME_NONNULL_BEGIN
/**
  The Router component is a module's connection to the workflow. No database entities or PONSOs shall be used in this component only identifiers or.
 
  Use this component to connect to a workflow using the WorkflowInput which has to be implemented by the chosen workflow.
 
  @b Protocols to implement
 
  The Router component implements a single protocol:

  @p RouterInput
 
 @code
 -(void)didFinishEditingSuperHeroOnRouter:(HEROBAseRouter*)router;
 */
@interface HEROBaseRouter : NSObject <HEROBaseRouterInterface>
@property (nonatomic, weak) HEROBaseWorkflow* workflow;
@property (nonatomic, weak) HEROBaseCoordinator* coordinator;
@property (nonatomic, weak) UIViewController* viewLayer;
@property (nonatomic, assign) BOOL hasNavigationInTabBar;
@property (nonatomic, strong) NSString* workflowKey;


- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflow:(HEROBaseWorkflow*)workflow workflowKey:(NSString*)workflowKey;


/**
 Push Router on Router Similar to pushViewController:animated:
 @Discussion if UINavigationController is present and PushViewController is possible
 @Discussion Fallback: present Router (presentViewController:animated:)
 @Discussion Similar to pushViewController:animated:
 
 @param router presentingRouter
 */
- (void)pushOnRouter:(HEROBaseRouter*)router;



/**
 ONLY use as first attempt to display Module on Window

 @param window The windows where the module is set as root Module (setRootViewcontroller)
 @param hasNavigation does Router needs
 */
- (void)presentOnWindow:(UIWindow*)window withNavigation:(BOOL)hasNavigation;
- (void)presentOnRouter:(HEROBaseRouter*)router inNavigationController:(BOOL)inNavigationController setAsRootView:(BOOL)setAsRootView transition:(nullable HEROBaseTransition*)transition;
- (void)exposeRouter;
@end
NS_ASSUME_NONNULL_END
