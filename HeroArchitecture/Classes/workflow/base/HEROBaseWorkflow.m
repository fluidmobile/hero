//
// HEROBaseWorkflow.m
// fluidArchitecture
//
// Created by Moritz Ellerbrock on 16/01/17.
// Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "HEROBaseWorkflow.h"
#import "HEROBaseUsecase.h"
#import "HERORouterReference.h"
#import "HEROBaseTabbarRouter.h"

@interface HEROBaseWorkflow()
@property (nonatomic, strong) NSMutableArray <HERORouterReference*>* routers;
@end

@implementation HEROBaseWorkflow

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    _routers = [@[] mutableCopy];
    return self;
}

- (HEROBaseCoordinator*)initialCoordinator {
    HEROBaseCoordinator* initialCoordinator = [self createInitialCoordinator];
    NSAssert(initialCoordinator, @"createInitialCoordinator returns nil");
    return initialCoordinator;
}

- (HEROBaseCoordinator *)createInitialCoordinator {
    NSAssert(NO, @"OVERRIDE: createInitialCoordinator in %@",[[self class] description]);
    return nil;
}

- (HEROBaseCoordinator*)dequeueCoordinatorForRouter:(Class)routerClass coordinator:(Class)coordinatorClass usecase:(Class)usecaseClass{
    return [self dequeueCoordinatorForRouter:routerClass coordinator:coordinatorClass usecase:usecaseClass workflowKey:@"DEFAULT"];
}

- (HEROBaseCoordinator*)dequeueCoordinatorForRouter:(Class)routerClass coordinator:(Class)coordinatorClass usecase:(Class)usecaseClass workflowKey:(NSString*)workflowKey{
    NSAssert(routerClass, @"NO router");
    NSArray<HEROBaseRouter*>* routers = [self allExistingRouterForClass:routerClass];
    if (coordinatorClass) {
        routers = [[self class] filterRouters:routers withCoordinatorClass:coordinatorClass];
    }
    if (usecaseClass) {
        routers = [[self class] filterRouters:routers withUsecase:usecaseClass];
    }
    
    if(workflowKey){
        routers = [[self class] filterRouters:routers withWorkflowKey:workflowKey];
    }
    
    if (routers && [routers count] > 0) {
        return [routers firstObject].coordinator;
    }
    HEROBaseCoordinator* coordinator = [self newCoordinatorForRouter:routerClass coordinator:coordinatorClass usecase:usecaseClass workflowKey:workflowKey];
    return coordinator;
}

- (HEROBaseCoordinator*)newCoordinatorForRouter:(Class)routerClass coordinator:(Class)coordinatorClass usecase:(Class)usecaseClass workflowKey:(NSString*)workflowKey{
    HEROBaseUsecase* usecase = [usecaseClass new];
    HEROBaseCoordinator* coordinator = [[coordinatorClass alloc] initWithUsecase:usecase];
    if (!coordinator) {
        coordinator = [[HEROBaseCoordinator alloc] initWithUsecase:usecase];
    }
    HEROBaseRouter* router = [[routerClass alloc] initWithCoordinator:coordinator workflow:self workflowKey:workflowKey];
    router.workflow = self;
    [self addRouter:router];
    return coordinator;
}
- (void)addRouter:(HEROBaseRouter*)router {
    NSAssert(router, @"NO Router");
    HERORouterReference* reference = [[HERORouterReference alloc] initWithRouter:router];
    [self.routers addObject:reference];
} 

- (HEROBaseRouter*)existingRouterForClass:(Class)routerClass {
    for (HERORouterReference* reference in self.routers) {
        if ([reference.router isKindOfClass:routerClass]) {
            return reference.router;
        }
    }
    return nil;
}

- (NSArray<HEROBaseRouter*>*)allExistingRouterForClass:(Class)routerClass {
    NSMutableArray<HEROBaseRouter*>* allExistingRouterForClass = [@[] mutableCopy];
    for (HERORouterReference* reference in self.routers) {
        if ([reference.router isKindOfClass:routerClass]) {
            [allExistingRouterForClass addObject:reference.router];
        }
    }
    return allExistingRouterForClass;
}

+ (NSArray<HEROBaseRouter*>*)filterRouters:(NSArray<HEROBaseRouter*>*)routers withCoordinatorClass:(Class)coordinatorClass {
    NSMutableArray<HEROBaseRouter*>* filteredRouterWithMatchingCoordinator = [@[] mutableCopy];
    for (HEROBaseRouter* router in routers) {
        if ([router.coordinator isKindOfClass:coordinatorClass]) {
            [filteredRouterWithMatchingCoordinator addObject:router];
        }
    }
    return filteredRouterWithMatchingCoordinator;
}

+ (NSArray<HEROBaseRouter*>*)filterRouters:(NSArray<HEROBaseRouter*>*)routers withUsecase:(Class)usecaseClass {
    NSMutableArray<HEROBaseRouter*>* filteredRouterWithMatchingUsecase = [@[] mutableCopy];
    for (HEROBaseRouter* router in routers) {
        if ([router.coordinator.usecase isKindOfClass:usecaseClass]) {
            [filteredRouterWithMatchingUsecase addObject:router];
        }
    }
    return filteredRouterWithMatchingUsecase;
}

+ (NSArray<HEROBaseRouter*>*)filterRouters:(NSArray<HEROBaseRouter*>*)routers withWorkflowKey:(NSString*)worflowKey {
    NSMutableArray<HEROBaseRouter*>* filteredRouterWithMatchingUsecase = [@[] mutableCopy];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"workflowKey == %@", worflowKey];
    NSArray* routersWithIdentifier = [routers filteredArrayUsingPredicate:predicate];
    return routersWithIdentifier;
}


- (HEROBaseWorkflow*)createAndConnectWorkflowForClass:(Class)workflowClass {
    HEROBaseWorkflow* workflow = [workflowClass new];
    workflow.parentWorkflow = self;
    return workflow;
}

- (void)tabbarDidSelectRouter:(HEROBaseRouter*)router {
    //if needed implement in subclass
}

@end

