//
//  FMApplicationService.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 06/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "FMBaseApplicationService.h"
@import UIKit;

@implementation FMBaseApplicationService
+ (void)applicationOpenUrl:(NSURL*)url{
	[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {}];
}

+ (void)applicationOpenMapsStreet:(NSString*)street city:(NSString*)city zipCode:(NSString*)zipCode{
	NSString* urlPartAsString = [NSString stringWithFormat:@"daddr=%@+%@+%@", street, city, zipCode];
	[self applicationOpenUrl:[self urlWithUrlPartAString:urlPartAsString]];
}

+ (void)applicationOpenMapsName:(NSString*)name longitude:(double)longitude latitude:(double)latitude{
	NSString* location = [NSString stringWithFormat:@"&ll=%f,%f",latitude, longitude];
	NSString* urlPartAsString = [NSString stringWithFormat:@"q=%@%@",name,location];
	[self applicationOpenUrl:[self urlWithUrlPartAString:urlPartAsString]];
}

+ (NSURL*)urlWithUrlPartAString:(NSString*)urlPartAsString{
	NSString* escaped = [urlPartAsString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
	return [NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?%@",escaped]];
}

+ (void)applicationOpenMapsName:(NSString*)name coordinates:(CLLocationCoordinate2D)coordinates{
	[self applicationOpenMapsName:name longitude:coordinates.longitude latitude:coordinates.latitude];
}

@end
