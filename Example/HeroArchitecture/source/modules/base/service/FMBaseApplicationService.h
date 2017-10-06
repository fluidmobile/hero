//
//  FMBaseApplicationService.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 06/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface FMBaseApplicationService : NSObject
+ (void)applicationOpenUrl:(NSURL*)url;
+ (void)applicationOpenMapsStreet:(NSString*)street city:(NSString*)city zipCode:(NSString*)zipCode;
+ (void)applicationOpenMapsName:(NSString*)name longitude:(double)longitude latitude:(double)latitude;
+ (void)applicationOpenMapsName:(NSString*)name coordinates:(CLLocationCoordinate2D)coordinates;
@end
