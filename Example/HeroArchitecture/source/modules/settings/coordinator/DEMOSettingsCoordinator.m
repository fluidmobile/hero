//
//  DEMOSettingsCoordinator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMOSettingsCoordinator.h"
@interface DEMOSettingsCoordinator()
@end

@implementation DEMOSettingsCoordinator
#pragma mark - DEMOSettingsViewOutput
- (void)userDidSelectlogout{
    [(id <DEMOSettingsUsecaseInput>)self.usecase logout];
}

-(void)isLoggedOut{
	[(id <DEMOSettingsRouterInput>)self.router isLoggedOut];
}

-(void)userDidselectDismiss{
	[(id <DEMOSettingsRouterInput>)self.router dismiss];
}
@end
