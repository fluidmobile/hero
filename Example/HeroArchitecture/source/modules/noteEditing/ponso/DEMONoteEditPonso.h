//
//  DEMONoteEditPonso.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DEMONoteEditPonso : NSObject
@property (nonatomic, readonly) NSString* noteID;
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* note;
-(instancetype)initWithNoteID:(NSString*)noteID title:(NSString*)title note:(NSString*)note;
@end
