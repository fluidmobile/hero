//
//  DEMOLoginCoordinator.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseCoordinator.h"
#import "DEMOLoginContracts.h"

@interface DEMOLoginCoordinator : HEROBaseCoordinator <DEMOLoginRouterOutput, DEMOLoginUsecaseOutput, DEMOLoginViewOutput>

@end
