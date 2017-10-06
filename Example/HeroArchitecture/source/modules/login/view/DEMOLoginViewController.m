//
//  DEMOLoginViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOLoginViewController.h"
#import "DEMOLoginView.h"
#import "DEMOLoginContracts.h"
//#import <Smooch/Smooch.h>

@interface DEMOLoginViewController () <DEMOLoginViewDelegate, DEMOLoginViewInput>
@property (nonatomic, strong) DEMOLoginView* viewLogin;
@end

@implementation DEMOLoginViewController

- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	self.title = @"Login";
	self.tabBarItem.image = [UIImage imageNamed:@"login"];
	return self;
}

-(void)loadView{
	self.viewLogin = [DEMOLoginView new];
	self.view = self.viewLogin;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.viewLogin.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
//	[Smooch show];
}

- (void)userDidSelectLogin{
	[(id <DEMOLoginViewOutput>)self.coordinator selectedLogin];
	[self.viewLogin loginIsDisabled:YES];
}

-(void)loginInProgress:(BOOL)inProgress{
	[self.viewLogin showProgressIndicator:inProgress];
}

- (void)loggedInFailed { 
	[self.viewLogin showProgressIndicator:NO];
	[self.viewLogin loginIsDisabled:NO];
}


-(void)loginIsDisabled:(BOOL)isDisabled{
	[self.viewLogin loginIsDisabled:isDisabled];
}

@end
