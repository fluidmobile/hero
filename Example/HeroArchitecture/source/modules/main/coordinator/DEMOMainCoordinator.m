//
//  DEMOMainCoordinator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMOMainCoordinator.h"
#import "HEROBaseRouter.h"

@interface DEMOMainCoordinator()
@end

@implementation DEMOMainCoordinator

-(void)selectedButtonIndex:(int)button{
    [(id <DEMOMainUsecaseInput>)self.usecase selectedButtonIndex:button];
}

- (void)selectedSegmentAtIndex:(int)index {
	[(id<DEMOMainUsecaseInput>)self.usecase selectedSegmentAtIndex:index];
}

-(void)updateIsLoggedIn:(BOOL)isLoggedIn{
	[(id <DEMOMainViewInput>)self.viewLayer updateIsLoggedIn:isLoggedIn];
}

- (void)selectedSelection:(DEMOMainSelection)selection {
	[(id<DEMOMainRouterInput>)self.router selectedSelection:selection];
}


@end
