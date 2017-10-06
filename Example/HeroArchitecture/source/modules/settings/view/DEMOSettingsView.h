//
//  DEMOSettingsView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"

@protocol DEMOSettingsViewDelegate <NSObject>

-(void)userDidLogout;
-(void)userDidDismiss;

@end

@interface DEMOSettingsView : HEROBaseView
@property (nonatomic, weak) id <DEMOSettingsViewDelegate> delegate;

@end
