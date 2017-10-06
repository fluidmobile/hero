//
//  DEMOLoginUsecase.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOLoginUsecase.h"
#import "DEMOCommonLoginService.h"

@interface DEMOLoginUsecase ()
@end

@implementation DEMOLoginUsecase

-(instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	[[DEMOCommonLoginService sharedInstance] addObserver:self forKeyPath:@"isLoggedInValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
	return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
	if ([keyPath isEqualToString:@"isLoggedInValue"]){
		[(id<DEMOLoginUsecaseOutput>)self.coordinator loginInProgress:NO];
		[(id<DEMOLoginUsecaseOutput>)self.coordinator loggedInSuccessful];
	}
}

-(void)selectedLogin{
	[[DEMOCommonLoginService sharedInstance] login];
	[(id<DEMOLoginUsecaseOutput>)self.coordinator loginInProgress:YES];
}

- (void)dealloc{
	[[DEMOCommonLoginService sharedInstance] removeObserver:self forKeyPath:@"isLoggedInValue"];
}

@end
