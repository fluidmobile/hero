//
//  DEMOMainUsecase.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMOMainUsecase.h"
#import "DEMOCommonLoginService.h"

@implementation DEMOMainUsecase
-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    NSObject* service = [DEMOCommonLoginService sharedInstance];
    [service addObserver:self forKeyPath:@"isLoggedInValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"isLoggedInValue"]){
        [self requestContentUpdate];
    }
}

-(void)dealloc{
    [[DEMOCommonLoginService sharedInstance] removeObserver:self forKeyPath:@"isLoggedInValue"];
}

-(void)requestContentUpdate{
	[self updateIsLoggedIn:[[DEMOCommonLoginService sharedInstance] isloggedIn]];
}

-(void)updateIsLoggedIn:(BOOL)isLoggedIn{
	[(id <DEMOMainUsecaseOutput>)self.coordinator updateIsLoggedIn:isLoggedIn];
}
- (void)selectedButtonIndex:(int)index {
	if (index == 0) {
		[(id<DEMOMainUsecaseOutput>)self.coordinator selectedSelection:DEMOMainSelectionSettings];
	}
}

- (void)selectedSegmentAtIndex:(int)index {
	switch (index) {
		case 0:
			[(id<DEMOMainUsecaseOutput>)self.coordinator selectedSelection:DEMOMainSelectionNotes];
			break;
		case 1:
			[(id<DEMOMainUsecaseOutput>)self.coordinator selectedSelection:DEMOMainSelectionPictures];
			break;
		case 2:
			[(id<DEMOMainUsecaseOutput>)self.coordinator selectedSelection:DEMOMainSelectionSwitches];
			break;
		default:
			break;
	}
}

@end
