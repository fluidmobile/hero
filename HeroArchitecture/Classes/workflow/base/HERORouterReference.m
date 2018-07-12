//
//  FMRouterReference.m
//  VERWUSPL
//
//  Created by Thomas on 05.10.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HERORouterReference.h"

@implementation HERORouterReference
-(instancetype)initWithRouter:(HEROBaseRouter*)router{
    self = [super init];
    if (!self) {
        return nil;
    }
    _router = router;
    return self;
}
@end
