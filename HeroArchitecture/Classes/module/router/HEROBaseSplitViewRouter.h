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
@interface HEROBaseSplitViewRouter : HEROBaseRouter  <UISplitViewControllerDelegate>
@property (nonatomic, weak, readonly) UINavigationController* navControllerRoot;
@property (nonatomic, weak, readonly) UINavigationController* navControllerDetail;

- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflowControl:(HEROBaseWorkflow*)workflowControl rootCoordinator:(HEROBaseCoordinator*)rootCoordinator detailCoordinator:(HEROBaseCoordinator*)detailCoordinator transition:(nullable HEROBaseTransition*)transition selectedRouter:(HEROBaseRouter *)selectedRouter workflowKey:(NSString*)workflowKey;

- (BOOL)isInitialized;
- (UISplitViewController*)splitViewController;
- (void)updateWithRootCoordinator:(HEROBaseCoordinator*)rootCoordinator detailCoordinator:(HEROBaseCoordinator*)detailCoordinator;
- (void)bringDetailToFront;
- (UISplitViewControllerDisplayMode)displayMode;
@end
NS_ASSUME_NONNULL_END
