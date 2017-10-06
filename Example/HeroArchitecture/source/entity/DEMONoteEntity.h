//
//  DEMONoteEntity.h
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEntity.h"

@interface DEMONoteEntity : DEMOEntity
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSDate* dateCreated;
@property (nonatomic, strong) NSDate* dateUpdated;

-(instancetype)initWithTitle:(NSString*)title text:(NSString*)text;
-(void)updateTitle:(NSString*)title note:(NSString*)note;
+(instancetype)objectForBeID:(NSString*)beID;
@end
