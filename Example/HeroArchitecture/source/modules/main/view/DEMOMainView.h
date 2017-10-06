//
//  DEMOMainView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"

@protocol DEMOMainViewDelegate <NSObject>
-(void)didSelectButton:(int)button;
-(void)selectedSegmentAtIndex:(int)index;
@end

@interface DEMOMainView : HEROBaseView
@property (nonatomic, weak) id <DEMOMainViewDelegate> delegate;
@property (nonatomic, strong) UIView* detailView; //iPad
-(void)updateIsLoggedIn:(BOOL)isLoggedIn;
@end
