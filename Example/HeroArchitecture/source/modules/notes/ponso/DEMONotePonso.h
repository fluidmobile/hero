//
//  DEMONotesNotePonso.h
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DEMONotePonso : NSObject
@property (nonatomic, readonly) NSString* noteID;
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* text;
@property (nonatomic, readonly) NSDate* creationDate;
-(instancetype)initWithNoteID:(NSString*)noteID title:(NSString*)title text:(NSString*)text creationDate:(NSDate*)creationDate;
@end
