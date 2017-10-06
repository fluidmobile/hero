//
//  DEMOLoginView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"

@protocol DEMOLoginViewDelegate <NSObject>

-(void)userDidSelectLogin;

@end

@interface DEMOLoginView : HEROBaseView
@property (nonatomic, weak) id<DEMOLoginViewDelegate> delegate;
-(void)showProgressIndicator:(BOOL)showProgress;
-(void)loginIsDisabled:(BOOL)isDisabled;
@end
