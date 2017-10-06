//
//  HEROBaseWorkflow.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 16/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "HEROBaseWorkflow.h"
#import "HEROBaseUsecase.h"
#import "HERORouterReference.h"

@implementation HEROBaseWorkflow

- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	_routers = [@[] mutableCopy];
	return self;
}

- (HEROBaseCoordinator*)initialCoordinator{
	
		HEROBaseCoordinator* initialCoordinator = [self createInitialCoordinator];
		NSAssert(initialCoordinator, @"createInitialCoordinator returns nil");
	
	return initialCoordinator;
}

- (HEROBaseRouter *)createInitialCoordinator{
	NSAssert(NO, @"OVERRIDE: createInitialCoordinator in %@",[[self class] description]);
	return nil;
}

- (HEROBaseCoordinator*)coordinatorForRouter:(Class)routerClass coordinator:(Class)coordinatorClass usecase:(Class)usecaseClass{
	HEROBaseUsecase* usecase = [usecaseClass new];
	HEROBaseCoordinator* coordinator = [[coordinatorClass alloc] initWithUsecase:usecase];
	HEROBaseRouter* router = [[routerClass alloc] initWithCoordinator:coordinator workflowControl:self];
	router.workflow = self;
	[self addRouter:router];
	return coordinator;
}

- (void)addRouter:(HEROBaseRouter*)router{
	HERORouterReference* reference = [HERORouterReference new];
	reference.router = router;
	[self.routers addObject:reference];
}

- (HEROBaseRouter*)existingRouterForClass:(Class)routerClass{
	for (HERORouterReference* reference in self.routers) {
		if ([reference.router isKindOfClass:routerClass]) {
#warning wir sollten hier einen key eintragen zur genauen identifikation
			return reference.router;
		}
	}
	return nil;
}

- (HEROBaseWorkflow*)workflowForWorkflow:(Class)workflowClass{
	HEROBaseWorkflow* workflow = [workflowClass new];
	workflow.parentWorkflow = self;
	return workflow;
}

- (void)tabbarDidSelectRouter:(HEROBaseRouter*)router{
	//if needed implement in subclass
}

@end

