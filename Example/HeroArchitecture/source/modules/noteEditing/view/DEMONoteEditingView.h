//
//  DEMONoteEditingView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"

@protocol DEMONoteEditingViewDelegate <NSObject>

@end

@interface DEMONoteEditingView : HEROBaseView
@property (nonatomic, weak) id <DEMONoteEditingViewDelegate> delegate;


@end
