//
//  DEMOPictureView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"

@protocol DEMOPictureViewDelegate <NSObject>
-(void)userDidSelectimage;
@end

@class DEMOPicturePonso;
@interface DEMOPictureView : HEROBaseView
@property (nonatomic, weak) id <DEMOPictureViewDelegate> delegate;
-(void)updatePicture:(DEMOPicturePonso *)picture;

@end
