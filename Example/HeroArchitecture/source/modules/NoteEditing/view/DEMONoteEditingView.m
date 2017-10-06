//
//  DEMONoteEditingView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteEditingView.h"

@interface DEMONoteEditingView()

@end
@implementation DEMONoteEditingView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
	[self setupViewPreserveContent:NO];
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

}

-(void)setupViewPreserveContent:(BOOL)preserveContent{
	
}

@end
