//
//  DEMOCommonLoginService.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOCommonLoginService.h"
#import "DEMOCommonUserDefaultService.h"

#define KEY_IS_LOGGED_IN @"KEY_IS_LOGGED_IN"

@interface DEMOCommonLoginService ()
@property (nonatomic, strong) NSNumber* isLoggedInValue;
@end

@implementation DEMOCommonLoginService
-(instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	NSNumber* loginValue = [DEMOCommonUserDefaultService loadFromUserDefaults:KEY_IS_LOGGED_IN];
	if (!loginValue){
		loginValue = @NO;
	}
	self.isLoggedInValue = loginValue;
	return self;
}

+ (DEMOCommonLoginService*)sharedInstance {
	static DEMOCommonLoginService* sharedInstance;
	@synchronized(self)
	{
		if (!sharedInstance) sharedInstance = [[self alloc] init];
		return sharedInstance;
	}
}

- (void)login{
	NSTimeInterval timeToLogin = (arc4random()%6)/2.0f;
	
	NSLog(@"WAIT FOR %.0f SECONDS",timeToLogin);
	[self performSelector:@selector(loginAfterDelay) withObject:nil afterDelay:timeToLogin];
}

- (void)loginAfterDelay{
	self.isLoggedInValue = @YES;
}

- (void)logout{
	self.isLoggedInValue = @NO;
}

- (BOOL)isloggedIn{
	return [self.isLoggedInValue boolValue];
}

-(void)setIsLoggedInValue:(NSNumber *)isLoggedInValue{
	_isLoggedInValue = isLoggedInValue;
	[DEMOCommonUserDefaultService saveToUserDefaults:self.isLoggedInValue key:KEY_IS_LOGGED_IN];
}

@end
