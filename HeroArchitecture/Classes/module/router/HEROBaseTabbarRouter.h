//
//  HEROBaseTabbarRouter.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 24/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseRouter.h"

@interface HEROBaseTabbarRouter : HEROBaseRouter
- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflowControl:(id)workflowControl coordinators:(NSArray <HEROBaseCoordinator*>*)coordinators transition:(HEROBaseTransition*)transition selectedRouter:(HEROBaseRouter *)selectedRouter;
- (UITabBarController*)tabBarController;
@end
