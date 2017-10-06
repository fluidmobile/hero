//
//  FMBasePhoneService.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 27/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMBasePhoneService : NSObject
+ (void)callPhoneNumber:(NSString*)phoneNumber withPrompt:(BOOL)prompt;
+ (NSString*)stripAllNonDigitSymbolsFromString:(NSString*)string;
@end
