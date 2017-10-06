//
//  FMFileService.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 06/03/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "FMBaseFileService.h"

@implementation FMBaseFileService
+ (BOOL)copyFileAtPath:(NSString*)sourcePath toPath:(NSString*)destinationPath{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if ([fileManager fileExistsAtPath:destinationPath]) {
		NSError* fileDeleError;
		[fileManager removeItemAtPath:destinationPath error:&fileDeleError];
	}
	if ([fileManager fileExistsAtPath:sourcePath]) {
		[self createFolderAtPath:[destinationPath stringByDeletingLastPathComponent]];
		NSError* fileCopyError;
		return [fileManager copyItemAtPath:sourcePath toPath:destinationPath error:&fileCopyError];
	}
	return NO;
}

+ (BOOL)createFolderAtPath:(NSString *)folderPath {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if ([fileManager fileExistsAtPath:folderPath]) {
		return NO;
	}
	NSError* error;
	BOOL hasCreatedDirectories = [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:&error];
	NSLog(@"%@",error);
	return hasCreatedDirectories;
}

@end
