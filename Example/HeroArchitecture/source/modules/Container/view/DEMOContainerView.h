//
//  DEMOContainerView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"

@protocol DEMOContainerViewDelegate <NSObject>

@end

@interface DEMOContainerView : HEROBaseView
@property (nonatomic, weak) id <DEMOContainerViewDelegate> delegate;
-(void)updateMasterView:(UIView *)viewMaster;
-(void)updateDetailView:(UIView *)viewDetail;


@end
