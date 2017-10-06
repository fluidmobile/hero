//
//  DEMOContainerRouter.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseRouter.h"
#import "DEMOContainerContracts.h"

@interface DEMOContainerRouter : HEROBaseRouter <DEMOContainerRouterInput>
-(void)updateMasterRouter:(HEROBaseRouter*)router;
-(void)updateDetailRouter:(HEROBaseRouter*)router;
@end
