//
//  DEMOMainRouter.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "HEROBaseRouter.h"
#import "DEMOMainContracts.h"

@interface DEMOMainRouter : HEROBaseRouter <DEMOMainRouterInput>
- (void)presentRouterInDetailView:(HEROBaseRouter*)router;
@end
