//
//  DEMOSettingsCoordinator.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseCoordinator.h"
#import "DEMOSettingsContracts.h"

@interface DEMOSettingsCoordinator : HEROBaseCoordinator <DEMOSettingsRouterOutput, DEMOSettingsViewOutput, DEMOSettingsUsecaseOutput>

@end
