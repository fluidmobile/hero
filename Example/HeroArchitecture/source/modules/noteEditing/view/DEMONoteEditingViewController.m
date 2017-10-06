//
//  DEMONoteEditingViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteEditingViewController.h"
#import "DEMONoteEditingView.h"

@interface DEMONoteEditingViewController () <DEMONoteEditingViewDelegate>
@property (nonatomic, strong) DEMONoteEditingView* viewNoteEditing;
@end

@implementation DEMONoteEditingViewController

- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	
	return self;
}


- (void)loadView{
    self.viewNoteEditing = [DEMONoteEditingView new];
    self.view = self.viewNoteEditing;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewNoteEditing.delegate = self;
}

-(void)updateNote:(DEMONoteEditPonso *)note{
#warning moritz not implemented
}

#pragma mark - DEMONoteEditingViewInput

#pragma mark - DEMONoteEditingViewDelegate

#pragma mark - Public

@end
