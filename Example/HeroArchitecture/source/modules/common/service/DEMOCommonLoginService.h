//
//  DEMOCommonLoginService.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DEMOCommonLoginService : NSObject
+ (DEMOCommonLoginService*)sharedInstance;
- (void)login;
- (void)logout;
- (BOOL)isloggedIn;
@end
