//
//  DEMONotesCoordinator.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseCoordinator.h"
#import "DEMONotesContracts.h"

@interface DEMONotesCoordinator : HEROBaseCoordinator <DEMONotesRouterOutput, DEMONotesViewOutput, DEMONotesUsecaseOutput>

@end
