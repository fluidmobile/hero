//
//  DEMOEditControlCoordinator.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseCoordinator.h"
#import "DEMOEditControlContracts.h"


@interface DEMOEditControlCoordinator : HEROBaseCoordinator <DEMOEditControlRouterOutput, DEMOEditControlUsecaseOutput, DEMOEditControlViewOutput>

@end
