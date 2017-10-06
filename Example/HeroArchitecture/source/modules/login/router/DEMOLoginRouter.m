//
//  DEMOLoginRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOLoginRouter.h"
#import "DEMOLoginContracts.h"
#import "DEMOLoginViewController.h"

@interface DEMOLoginRouter () <DEMOLoginRouterInput>

@end

@implementation DEMOLoginRouter

-(Class)viewControllerClass{
	return [DEMOLoginViewController class];
}

- (void)presentForLoggedIn{
	[(id <DEMOLoginRouterWorkflowControl>)self.workflow loggedInOnRouter:self];
}

@end
