//
//  DEMOPictureCoordinator.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseCoordinator.h"
#import "DEMOPictureContracts.h"


@interface DEMOPictureCoordinator : HEROBaseCoordinator <DEMOPictureRouterOutput, DEMOPictureUsecaseOutput, DEMOPictureViewOutput>

@end
