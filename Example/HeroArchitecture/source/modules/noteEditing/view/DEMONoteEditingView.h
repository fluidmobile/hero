//
//  DEMONoteEditingView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"
@class DEMONoteEditPonso;
@protocol DEMONoteEditingViewDelegate <NSObject>
@end

@interface DEMONoteEditingView : HEROBaseView
@property (nonatomic, weak) id <DEMONoteEditingViewDelegate> delegate;
-(void)updateNote:(DEMONoteEditPonso*)note;

@end
