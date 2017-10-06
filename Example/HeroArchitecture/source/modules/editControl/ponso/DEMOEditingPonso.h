//
//  DEMOEditingPonso.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DEMOEditingMode.h"

@interface DEMOEditingPonso : NSObject
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) DEMOEditingMode mode;
@property (nonatomic, assign) BOOL isSelected;
-(instancetype)initWithTitle:(NSString*)title mode:(DEMOEditingMode)mode;
-(NSString*)iconString;
@end
