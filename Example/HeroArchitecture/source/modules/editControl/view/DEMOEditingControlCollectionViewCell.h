//
//  DEMOEditingControlCollectionViewCell.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_EDITING_CONTROL @"CELL_EDITING_CONTROL"

@class DEMOEditingPonso;

@interface DEMOEditingControlCollectionViewCell : UICollectionViewCell
-(void)updateEditingControl:(DEMOEditingPonso*)editingControl;
@end
