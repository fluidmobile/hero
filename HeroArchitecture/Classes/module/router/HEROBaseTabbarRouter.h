//
//  HEROBaseTabbarRouter.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 24/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseRouter.h"
NS_ASSUME_NONNULL_BEGIN
@class HEROBaseCoordinator, HEROBaseTransition, HEROBaseWorkflow;
@interface HEROBaseTabbarRouter : HEROBaseRouter
- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflowControl:(HEROBaseWorkflow*)workflowControl coordinators:(NSArray <HEROBaseCoordinator*>*)coordinators transition:(nullable HEROBaseTransition*)transition selectedRouter:(HEROBaseRouter *)selectedRouter workflowKey:(NSString*)workflowKey;
- (BOOL)isInitialized;
- (UITabBarController*)tabBarController;
- (void)updateWithCoordinators:(NSArray <HEROBaseCoordinator*>*)coordinators;
@end
NS_ASSUME_NONNULL_END
