//
//  HEROBaseTabbarRouter.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 24/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseRouter.h"

@class HEROBaseCoordinator, HEROBaseTransition, HEROBaseWorkflow;
@interface HEROBaseTabbarRouter : HEROBaseRouter
- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflowControl:(HEROBaseWorkflow*)workflowControl coordinators:(NSArray <HEROBaseCoordinator*>*)coordinators transition:(HEROBaseTransition*)transition selectedRouter:(HEROBaseRouter *)selectedRouter;
- (BOOL)isInitialized;
- (UITabBarController*)tabBarController;
@end
