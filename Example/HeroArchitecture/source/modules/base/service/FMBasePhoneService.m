//
//  FMBasePhoneService.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 27/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "FMBasePhoneService.h"
#import "FMBaseApplicationService.h"

@implementation FMBasePhoneService

+ (void)callPhoneNumber:(NSString*)phoneNumber withPrompt:(BOOL)prompt{
	NSString* method = prompt?@"telprompt://":@"tel://";
	NSString* escaped = [self stripAllNonDigitSymbolsFromString:phoneNumber];
	NSURL* urlPhone = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", method, escaped]];
	[FMBaseApplicationService applicationOpenUrl:urlPhone];
}

+ (NSString*)stripAllNonDigitSymbolsFromString:(NSString*)string{
	return [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet decimalDigitCharacterSet]];
}
@end

