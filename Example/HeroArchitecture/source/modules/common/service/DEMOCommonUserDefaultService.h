//
//  DEMOCommonUserDefaultService.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DEMOCommonUserDefaultService : NSObject
+(BOOL)isEqualToUserDefaults:(NSObject*)object forkey:(NSString*)key;
+(void)saveToUserDefaults:(NSObject*)object key:(NSString*)key;
+(id)loadFromUserDefaults:(NSString*)key;
+(void)clearAllPersistentData;
@end
