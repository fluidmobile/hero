//
//  HEROBaseTabbarRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 24/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseSplitViewRouter.h"
#import "HERORouterReference.h"
#import "HEROBaseCoordinator.h"
#import "HEROBaseWorkflow.h"
#import "HERONavigationController.h"
#import "HEROBaseSplitViewController.h"
#import "HEROBaseViewController.h"
#import "HEROBaseSplitViewController.h"


@interface HEROBaseSplitViewRouter ()
@property (nonatomic, strong) HEROBaseCoordinator* coordinatorRoot;
@property (nonatomic, strong) HEROBaseCoordinator* coordinatorDetail;
@property (nonatomic, weak) HEROBaseRouter *selectedRouter;

@end

@implementation HEROBaseSplitViewRouter
@synthesize viewLayer = _viewLayer;


- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflowControl:(HEROBaseWorkflow*)workflowControl rootCoordinator:(HEROBaseCoordinator*)rootCoordinator detailCoordinator:(HEROBaseCoordinator*)detailCoordinator transition:(HEROBaseTransition*)transition selectedRouter:(HEROBaseRouter *)selectedRouter workflowKey:(NSString*)workflowKey{
    self = [super initWithCoordinator:coordinator workflow:workflowControl workflowKey:workflowKey];
    if (!self){
        return nil;
    }
    _selectedRouter = selectedRouter;
    _coordinatorRoot = rootCoordinator;
    _coordinatorDetail = detailCoordinator;
    
    return self;
}

//NEVER CALL
- (Class)viewControllerClass {
    NSAssert(NO, @"NEVER CALL");
    return nil;
}


- (UIViewController *)viewLayer {
    if (!_viewLayer){
        HEROBaseSplitViewController* splitViewController = [HEROBaseSplitViewController new];
        splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
        splitViewController.delegate = self;
        NSArray<__kindof UIViewController *> *viewControllers = [self tabbarViewControllers];
        splitViewController.viewControllers = viewControllers;
        splitViewController.coordinator = self.coordinator;
        _viewLayer = splitViewController;
        return splitViewController;
    }
    else{
        return _viewLayer;
    }
}

-(UISplitViewController *)splitViewController{
    return (UISplitViewController*)self.viewLayer;
}
- (NSArray<UIViewController*>*)tabbarViewControllers {
    return @[[_coordinatorRoot.router viewLayer], [_coordinatorDetail.router viewLayer]];
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
    return self.coordinatorRoot != nil;
}

- (UITabBarController*)tabBarController {
    return (UITabBarController*)self.viewLayer;
}



- (void)updateWithRootCoordinator:(HEROBaseCoordinator*)rootCoordinator detailCoordinator:(HEROBaseCoordinator*)detailCoordinator{
    self.coordinatorRoot = rootCoordinator;
    self.coordinatorDetail = detailCoordinator;
    if (self.viewLayer){
        UIViewController* rootViewController = (UIViewController*)self.coordinatorRoot.viewLayer;
        UINavigationController* navControllerRoot = [[HERONavigationController alloc] initWithRootViewController:rootViewController];
        _navControllerRoot = navControllerRoot;
        
        UIViewController* detailViewController = (UIViewController*)self.coordinatorDetail.viewLayer;
        UINavigationController* navControllerDetail = [[HERONavigationController alloc] initWithRootViewController:detailViewController];
        _navControllerDetail = navControllerDetail;
        
        
        ((HEROBaseSplitViewController*)self.viewLayer).viewControllers = @[navControllerRoot,navControllerDetail];
    }
    else{
        NSAssert (NO,@"no layer");
    }
}


- (BOOL)splitViewController:(UISplitViewController *)splitViewController
collapseSecondaryViewController:(UIViewController *)secondaryViewController
  ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return YES;
}

-(UIViewController *)primaryViewControllerForExpandingSplitViewController:(UISplitViewController *)splitViewController{
    return self.navControllerRoot;
}

-(UIViewController *)primaryViewControllerForCollapsingSplitViewController:(UISplitViewController *)splitViewController{
    return self.navControllerRoot;
}

-(void)bringDetailToFront{
    [self.splitViewController showDetailViewController:self.navControllerDetail sender:self];
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController showViewController:(UIViewController *)vc sender:(nullable id)sender NS_AVAILABLE_IOS(8_0){
    return YES;
}
@end

