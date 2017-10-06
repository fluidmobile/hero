//
//  DEMONoteService.h
//  VERWUSPL
//
//  Created by Moritz Ellerbrock on 05.10.17.
//Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DEMONoteEntity;

@interface DEMONoteService : NSObject
+(void)saveNoteEntity:(DEMONoteEntity*)noteEntity;
@end
