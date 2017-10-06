//
//  DEMOLoginCoordinator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOLoginCoordinator.h"

@implementation DEMOLoginCoordinator

- (void)loggedInFailed {
	[(id <DEMOLoginViewInput>)self.viewLayer loggedInFailed];
}

- (void)loggedInSuccessful {
	[(id<DEMOLoginRouterInput>)self.router presentForLoggedIn];
}

-(void)loginInProgress:(BOOL)inProgress{
	[(id <DEMOLoginViewInput>)self.viewLayer loginInProgress:inProgress];
}

- (void)selectedLogin {
	[(id<DEMOLoginUsecaseInput>)self.usecase selectedLogin];
}

@end
