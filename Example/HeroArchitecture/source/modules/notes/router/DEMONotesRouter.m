//
//  DEMONotesRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMONotesRouter.h"
#import "DEMONotesViewController.h"
@interface DEMONotesRouter()
@end

@implementation DEMONotesRouter

-(Class)viewControllerClass{
    return [DEMONotesViewController class];
}

@end
