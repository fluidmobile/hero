//
//  DEMOEditControlView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"

@protocol DEMOEditControlViewDelegate <NSObject>

@end

@interface DEMOEditControlView : HEROBaseView
@property (nonatomic, weak) id <DEMOEditControlViewDelegate> delegate;
-(UICollectionView*)collectionView;
@end
