//
//  DEMONotesVIewTableViewCell.h
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROTableViewCell.h"

#define CELL_NOTE @"CELL_NOTE"

@interface DEMONotesViewTableViewCell : HEROTableViewCell
-(void)updateText:(NSString*)text;
@end
