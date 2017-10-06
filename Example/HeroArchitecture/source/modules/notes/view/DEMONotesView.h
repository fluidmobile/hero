//
//  DEMONotesView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"

@protocol DEMONotesViewDelegate <NSObject>


@end

@interface DEMONotesView : HEROBaseView
@property (nonatomic, weak) id <DEMONotesViewDelegate> delegate;
@property (nonatomic, readonly) UITableView* tableView;
@end
