//
//  HEROBaseUsecase.m
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseUsecase.h"

@implementation HEROBaseUsecase
- (void)requestContentUpdate {
    //default, content is always ready. async callback
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.coordinator contentDidChange];
    });
}
@end
