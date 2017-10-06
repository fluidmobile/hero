//
//  DEMOCommonUserDefaultService.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOCommonUserDefaultService.h"

@implementation DEMOCommonUserDefaultService

+(BOOL)isEqualToUserDefaults:(NSObject*)object forkey:(NSString*)key{
	id oldObject = [[NSUserDefaults standardUserDefaults] objectForKey:key];
	
	if ([object isKindOfClass:[oldObject class]] == YES) {
		if ([object isKindOfClass:[NSString class]] == YES) {
			return [(NSString*)object isEqualToString:(NSString*)oldObject] == YES;
		}
		else if([object isKindOfClass:[NSNumber class]] == YES){
			return [(NSNumber*)object isEqualToNumber:(NSNumber*)oldObject] == YES;
		}
	}
	return NO;
}

+(void)saveToUserDefaults:(NSObject*)object key:(NSString*)key{
	if (object){
		[[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
	}
	else{
		[[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
	}
	[[NSUserDefaults standardUserDefaults] synchronize];
}

+(id)loadFromUserDefaults:(NSString*)key{
	return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(void)clearAllPersistentData{
	NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
	[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

@end
