//
//  FMBaseAppAnalyzerService.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 27/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FMBaseAppAnalyzerService : NSObject
+ (void)logEvent:(NSString *)eventName;
+ (void)logEvent:(NSString *)eventName attributes:(NSDictionary *)attributes;

@end
