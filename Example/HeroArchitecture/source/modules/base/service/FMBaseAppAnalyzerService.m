//
//  FMBaseAppAnalyzerService.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 27/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "FMBaseAppAnalyzerService.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wall"
//#import <Localytics/Localytics.h>
//#import <Crashlytics/Answers.h>
#pragma clang pop




@implementation FMBaseAppAnalyzerService
+ (void)logEvent:(NSString *)eventName{
//    [Localytics tagEvent:eventName];
	//    [Answers logCustomEventWithName:eventName
	//                   customAttributes:@{}];
}

+ (void)logEvent:(NSString *)eventName attributes:(NSDictionary *)attributes{
//    [Localytics tagEvent:eventName attributes:attributes];
	//    [Answers logCustomEventWithName:eventName
	//                   customAttributes:attributes];
}

@end

