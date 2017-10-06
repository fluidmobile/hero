//
//  DEMOContainerViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOContainerViewController.h"
#import "DEMOContainerView.h"

@interface DEMOContainerViewController () <DEMOContainerViewDelegate>
@property (nonatomic, strong) DEMOContainerView* viewContainer;
@property (nonatomic, strong) HEROBaseViewController* viewControllerMaster;
@property (nonatomic, strong) HEROBaseViewController* viewControllerDetail;
@end

@implementation DEMOContainerViewController

- (void)loadView{
    self.viewContainer = [DEMOContainerView new];
    self.view = self.viewContainer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewContainer.delegate = self;
	[self.viewContainer updateMasterView:self.viewControllerMaster.view];
	[self.viewContainer updateDetailView:self.viewControllerDetail.view];
}

#pragma mark - DEMOContainerViewInput

- (void)updateMasterViewController:(HEROBaseViewController *)viewController {
	if (self.viewControllerMaster) {
		[self.viewControllerMaster removeFromParentViewController];
	}
	self.viewControllerMaster = viewController;
	[self addChildViewController:self.viewControllerMaster];
	[self.viewControllerMaster didMoveToParentViewController:self];
	[self.viewContainer updateMasterView:self.viewControllerMaster.view];
}

- (void)updateDetailViewController:(HEROBaseViewController *)viewController {
	if (self.viewControllerDetail) {
		[self.viewControllerDetail removeFromParentViewController];
	}
	self.viewControllerDetail = viewController;
	[self addChildViewController:self.viewControllerDetail];
	[self.viewControllerDetail didMoveToParentViewController:self];
	[self.viewContainer updateDetailView:self.viewControllerDetail.view];
	
}

#pragma mark - DEMOContainerViewDelegate

#pragma mark - Public

@end
