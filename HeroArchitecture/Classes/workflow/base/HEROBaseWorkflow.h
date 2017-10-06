//
//  HEROBaseWorkflow.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 16/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseWorkflowInterface.h"
#import "HERORouterReference.h"

@interface HEROBaseWorkflow : NSObject <HEROBaseWorkflowInterface>

@property (nonatomic, weak) HEROBaseWorkflow* parentWorkflow;
@property (nonatomic, strong) NSMutableArray <HERORouterReference*>* routers;

- (void)tabbarDidSelectRouter:(HEROBaseRouter*)router;
- (HEROBaseCoordinator*)coordinatorForRouter:(Class)routerClass coordinator:(Class)coordinatorClass usecase:(Class)usecaseClass;
- (HEROBaseRouter*)existingRouterForClass:(Class)routerClass;
- (HEROBaseWorkflow*)workflowForWorkflow:(Class)workflowClass;
- (HEROBaseCoordinator *)initialCoordinator;
- (void)addRouter:(HEROBaseRouter*)router;
@end

