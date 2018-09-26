//
//  HEROBaseWorkflow.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 16/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseWorkflowInterface.h"
#import "HERORouterReference.h"

NS_ASSUME_NONNULL_BEGIN
@interface HEROBaseWorkflow : NSObject <HEROBaseWorkflowInterface>
@property (nonatomic, weak) HEROBaseWorkflow* parentWorkflow;

- (void)tabbarDidSelectRouter:(HEROBaseRouter*)router;
- (HEROBaseCoordinator*)dequeueCoordinatorForRouter:(Class)routerClass coordinator:(nullable Class)coordinatorClass usecase:(nullable Class)usecaseClass workflowKey:(NSString*)workflowKey;
- (HEROBaseCoordinator*)dequeueCoordinatorForRouter:(Class)routerClass coordinator:(nullable Class)coordinatorClass usecase:(nullable Class)usecaseClass;
- (HEROBaseCoordinator *)initialCoordinator;
- (HEROBaseRouter*)existingRouterForClass:(Class)routerClass;
- (void)addRouter:(HEROBaseRouter*)router;
- (HEROBaseWorkflow*)createAndConnectWorkflowForClass:(Class)workflowClass;
@end
NS_ASSUME_NONNULL_END
