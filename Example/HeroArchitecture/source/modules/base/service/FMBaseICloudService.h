//
//  FMBaseICloudService.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 10/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FMBaseICloudService : NSObject
+ (BOOL)addSkipBackupiCloudAttributeToItemAtURL:(NSURL *)URL;
+ (void)saveKey:(NSString*)key string:(NSString*)string;
+ (void)saveKey:(NSString*)key number:(NSNumber  *)number;
+ (NSString*)getStringForKey:(NSString*)key;
+ (NSNumber*)getNumberForKey:(NSString*)key;
@end
