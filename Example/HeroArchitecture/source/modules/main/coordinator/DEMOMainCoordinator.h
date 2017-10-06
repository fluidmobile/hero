//
//  DEMOMainCoordinator.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseCoordinator.h"
#import "DEMOMainContracts.h"

@interface DEMOMainCoordinator : HEROBaseCoordinator <DEMOMainRouterOutput, DEMOMainUsecaseOutput, DEMOMainViewOutput>



@end
