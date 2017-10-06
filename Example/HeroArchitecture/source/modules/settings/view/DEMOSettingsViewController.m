//
//  DEMOSettingsViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMOSettingsViewController.h"
#import "DEMOSettingsView.h"
#import "HEROBaseCoordinator.h"

@interface DEMOSettingsViewController () <DEMOSettingsViewDelegate>
    @property (nonatomic, strong) DEMOSettingsView* viewLogout;
@end

@implementation DEMOSettingsViewController
- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	self.title = @"Settings";
	return self;
}

-(void)loadView{
    self.viewLogout = [DEMOSettingsView new];
    self.view = self.viewLogout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewLogout.delegate = self;
}

#pragma mark - DEMOSettingsViewOutput
- (void)userDidLogout{
    [(id<DEMOSettingsViewOutput>)self.coordinator userDidSelectlogout];
}

-(void)userDidDismiss{
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

@end
