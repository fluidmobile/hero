//
//  DEMOEditControlCoordinator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEditControlCoordinator.h"
#import "HEROBaseRouter.h"

@implementation DEMOEditControlCoordinator


#pragma mark - DEMOEditControlRouterOutput

#pragma mark - DEMOEditControlUsecaseOutput
- (void)requestViewUpdate {
	[(id<DEMOEditControlViewInput>)self.viewLayer requestViewUpdate];
}

- (void)switchedToEditingMode:(DEMOEditingMode)editingMode {
	[(id<DEMOEditControlRouterInput>)self.router switchedToEditingMode:editingMode];
}

#pragma mark - DEMOEditControlViewOutput
- (long)numberOfSections {
	return [(id<DEMOEditControlUsecaseInput>)self.usecase numberOfSections];
}

- (long)numberOfItemsInSection:(long)section {
	return [(id<DEMOEditControlUsecaseInput>)self.usecase numberOfItemsInSection:section];
}

- (DEMOEditingPonso *)editingItemForIndex:(long)index {
	return [(id<DEMOEditControlUsecaseInput>)self.usecase editingItemForIndex:index];
}

- (void)selectedEditingItemAtIndex:(long)index {
	[(id<DEMOEditControlUsecaseInput>)self.usecase selectedEditingItemAtIndex:index];
}

@end
