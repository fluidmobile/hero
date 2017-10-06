//
//  DEMOSettingsUsecase.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOSettingsUsecase.h"
#import "DEMOCommonLoginService.h"

@implementation DEMOSettingsUsecase

- (void)logout{
    [[DEMOCommonLoginService sharedInstance] logout];
	[(id<DEMOSettingsUsecaseOutput>)self.coordinator isLoggedOut];
}
@end
