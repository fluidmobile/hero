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

- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflowControl:(HEROBaseWorkflow*)workflowControl rootCoordinator:(HEROBaseCoordinator*)rootCoordinator detailCoordinator:(HEROBaseCoordinator*)detailCoordinator transition:(nullable HEROBaseTransition*)transition selectedRouter:(HEROBaseRouter *)selectedRouter workflowKey:(NSString*)workflowKey{
    self = [super initWithCoordinator:coordinator workflow:workflowControl workflowKey:workflowKey];
    if (!self){
        return nil;
    }
    _selectedRouter = selectedRouter;
    _coordinatorRoot = rootCoordinator;
    _coordinatorDetail = detailCoordinator;
    return self;
}

- (Class)viewControllerClass {
    NSAssert(NO, @"NEVER CALL");
    return nil;
}

- (UIViewController *)viewLayer {
    if (!_viewLayer){
        HEROBaseSplitViewController* splitViewController = [HEROBaseSplitViewController new];
        splitViewController.preferredDisplayMode = [self displayMode];
        splitViewController.maximumPrimaryColumnWidth = 500;
        splitViewController.preferredPrimaryColumnWidthFraction = 0.3f;
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

-(UISplitViewControllerDisplayMode)displayMode{
    return UISplitViewControllerDisplayModeAutomatic;
}

-(UISplitViewController *)splitViewController{
    return (UISplitViewController*)self.viewLayer;
}
- (NSArray<UIViewController*>*)tabbarViewControllers {
    return @[[_coordinatorRoot.router viewLayer], [_coordinatorDetail.router viewLayer]];
}

#pragma mark - Public
- (BOOL)isInitialized {
    return self.coordinatorRoot != nil;
}

- (UITabBarController*)tabBarController {
    return (UITabBarController*)self.viewLayer;
}

- (void)updateWithRootCoordinator:(nonnull HEROBaseCoordinator*)rootCoordinator detailCoordinator:(nonnull HEROBaseCoordinator*)detailCoordinator{
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
          [self updateBarItem];
    }
    else{
        NSAssert (NO,@"no layer");
    }
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
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
[self updateBarItem];
    
}

- (void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode NS_AVAILABLE_IOS(8_0){
    //change behavior
}

-(void)showList:(id)sender{
    [self.splitViewController showViewController:self.navControllerRoot sender:self];
}

- (void)updateBarItem {
    if ([self.navControllerDetail.viewControllers firstObject].navigationItem.leftBarButtonItems.count == 0){
        [self.navControllerDetail.viewControllers firstObject].navigationItem.leftBarButtonItems = @[self.splitViewController.displayModeButtonItem];
        [self.navControllerDetail.viewControllers firstObject].navigationItem.leftItemsSupplementBackButton = YES;
    }
}
@end

