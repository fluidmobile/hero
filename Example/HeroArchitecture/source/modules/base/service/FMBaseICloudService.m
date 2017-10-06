//
//  FMBaseICloudService.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 10/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "FMBaseICloudService.h"

@implementation FMBaseICloudService
+ (BOOL)addSkipBackupiCloudAttributeToItemAtURL:(NSURL *)URL{
	if ([[NSFileManager defaultManager] fileExistsAtPath:[URL path]] == YES){
		NSError *error = nil;
		BOOL success = [URL setResourceValue:@(YES)
									  forKey:NSURLIsExcludedFromBackupKey error:&error];
		if (!success) {
			NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
		}
		return success;
	}
	return NO;
}

+ (void)saveKey:(NSString*)key object:(id)object{
	NSUbiquitousKeyValueStore *keyStore = [NSUbiquitousKeyValueStore defaultStore];
	[keyStore setString:object forKey:key];
	[keyStore synchronize];
}

+ (id)getValueForKey:(NSString*)key{
	NSUbiquitousKeyValueStore *keyStore = [NSUbiquitousKeyValueStore defaultStore];
	id storedString = [keyStore stringForKey:key];
	return storedString;
}


//convenience
+ (void)saveKey:(NSString*)key string:(NSString*)string{
	[self saveKey:key object:string];
}

+ (void)saveKey:(NSString*)key number:(NSNumber  *)number{
	[self saveKey:key object:number];
}

+ (NSString*)getStringForKey:(NSString*)key{
	return (NSString*)[self getValueForKey:key];
}

+ (NSNumber*)getNumberForKey:(NSString*)key{
	return (NSNumber*)[self getValueForKey:key];
}

@end

