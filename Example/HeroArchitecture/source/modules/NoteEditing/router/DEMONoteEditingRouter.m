//
//  DEMONoteEditingRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteEditingRouter.h"
#import "DEMONoteEditingViewController.h"
#import "DEMONoteEditingContracts.h"

@implementation DEMONoteEditingRouter

-(Class)viewControllerClass{
	return [DEMONoteEditingViewController class];
}

#pragma mark - DEMONoteEditingRouterInput
-(void)didFinishEditing{
	[(id<DEMONoteEditingRouterWorkflowControl>)self.workflow noteEditingDidFinishEditingOnRouter:self];
}

@end
