//
//  HEROBaseTabbarRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 24/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseTabbarRouter.h"
#import "HERORouterReference.h"
#import "HEROBaseCoordinator.h"
#import "HEROBaseWorkflow.h"
#import "HERONavigationController.h"
#import "HEROBaseTabBarController.h"
#import "HEROBaseViewController.h"

@interface HEROBaseTabbarRouter () <UITabBarControllerDelegate>
@property (nonatomic, strong) NSArray <HEROBaseCoordinator*> *coordinators;
@property (nonatomic, weak) HEROBaseRouter *selectedRouter;
@end

@implementation HEROBaseTabbarRouter
@synthesize viewLayer = _viewLayer;
- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflowControl:(HEROBaseWorkflow*)workflowControl coordinators:(NSArray <HEROBaseCoordinator*>*)coordinators transition:(nullable HEROBaseTransition*)transition selectedRouter:(HEROBaseRouter *)selectedRouter workflowKey:(NSString*)workflowKey{
    self = [super initWithCoordinator:coordinator workflow:workflowControl workflowKey:workflowKey];
    if (!self){
        return nil;
    }
    _selectedRouter = selectedRouter;
    _coordinators = coordinators;
    return self;
}

//NEVER CALL
- (Class)viewControllerClass {
    NSAssert(NO, @"NEVER CALL");
    return nil;
}

- (UIViewController *)viewLayer {
    if (!_viewLayer){
        HEROBaseTabBarController* tabBarController = [HEROBaseTabBarController new];
        tabBarController.delegate = self;
        NSArray<__kindof UIViewController *> *viewControllers = [self tabbarViewControllers];
        tabBarController.viewControllers = viewControllers;
        tabBarController.coordinator = self.coordinator;
        _viewLayer = tabBarController;
        return tabBarController;
    }
    else{
        return _viewLayer;
    }
}

- (NSArray<UIViewController*>*)tabbarViewControllers {
    NSMutableArray* viewControllers = [@[] mutableCopy];
    for (HEROBaseCoordinator* coordinator in self.coordinators){
        if (coordinator.router.hasNavigationInTabBar) {
            [viewControllers addObject:[coordinator.router viewLayer]];
        }
        else{
            [viewControllers addObject:[[HERONavigationController alloc] initWithRootViewController:[coordinator.router viewLayer]]];
        }
    }
    return viewControllers;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    UIViewController* viewControllerSelected = viewController;
    if ([viewControllerSelected isKindOfClass:[UINavigationController class]]) {
        viewControllerSelected = [viewControllerSelected.childViewControllers firstObject];
    }
    if ([viewControllerSelected isKindOfClass:[HEROBaseViewController class]]) {
        HEROBaseRouter* router = ((HEROBaseViewController*)viewControllerSelected).coordinator.router;
        [self.workflow tabbarDidSelectRouter:router];
    }
}

#pragma mark - Public
- (BOOL)isInitialized {
    return [self.coordinators count] > 0;
}

- (nonnull UITabBarController*)tabBarController {
    return (UITabBarController*)self.viewLayer;
}

- (void)updateWithCoordinators:(nonnull NSArray<HEROBaseCoordinator *> *)coordinators {
    self.coordinators = coordinators;
    if (_viewLayer) {
        NSArray<__kindof UIViewController *> *viewControllers = [self tabbarViewControllers];
        [self tabBarController].viewControllers = viewControllers;
    }
}
@end
