//
//  FMFileService.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 06/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FMBaseFileService : NSObject
+ (BOOL)copyFileAtPath:(NSString*)sourcePath toPath:(NSString*)destinationPath;
+ (BOOL)createFolderAtPath:(NSString *)folderPath;
@end
