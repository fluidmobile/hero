//
//  DEMOEditControlUsecase.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEditControlUsecase.h"
#import "DEMOEditingPonso.h"

@interface DEMOEditControlUsecase ()
@property (nonatomic, strong) NSArray<DEMOEditingPonso*>* editingControls;
@end

@implementation DEMOEditControlUsecase
-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
	_editingControls = [self createEditingControls];
    return self;
}

-(NSArray<DEMOEditingPonso*>*)createEditingControls{
	NSMutableArray<DEMOEditingPonso*>* editingControls = [@[] mutableCopy];
	[editingControls addObject:[[DEMOEditingPonso alloc] initWithTitle:@"add" mode:DEMOEditingModeAdd]];
	[editingControls addObject:[[DEMOEditingPonso alloc] initWithTitle:@"edit" mode:DEMOEditingModeEdit]];
	[editingControls addObject:[[DEMOEditingPonso alloc] initWithTitle:@"remove" mode:DEMOEditingModeRemove]];
	return editingControls;
}

#pragma mark - DEMOEditControlUsecaseInput
- (DEMOEditingPonso *)editingItemForIndex:(long)index {
	if(index < [self.editingControls count]){
		return self.editingControls[index];
	}
	return nil;
}

- (long)numberOfItemsInSection:(long)section {
	return [self.editingControls count];
}

- (long)numberOfSections {
	return 1;
}

- (void)selectedEditingItemAtIndex:(long)index {
	[self selectEditingControlAtIndex:index];
	[self requestViewUpdate];
	//TODO: send updatedMode to next module
}

-(void)selectEditingControlAtIndex:(long)index{
	int counter = 0;
	for (DEMOEditingPonso* editingControl in self.editingControls) {
		editingControl.isSelected = counter == index;
		counter++;
	}
}

#pragma mark - Helper

-(void)requestViewUpdate{
	if ([NSThread isMainThread]) {
		[(id<DEMOEditControlUsecaseOutput>)self.coordinator requestViewUpdate];
	}
	else{
		dispatch_async(dispatch_get_main_queue(), ^{
			[(id<DEMOEditControlUsecaseOutput>)self.coordinator requestViewUpdate];
		});
	}
}

-(void)sendUpdatedEditingMode{
	NSPredicate* filterSelected = [NSPredicate predicateWithFormat:@"isSelected == YES"];
	NSArray<DEMOEditingPonso*>* selected = [self.editingControls filteredArrayUsingPredicate:filterSelected];
	if ([selected count] == 1) {
		DEMOEditingPonso* selectedEditingControl = [selected firstObject];
		if ([NSThread isMainThread]) {
			[(id<DEMOEditControlUsecaseOutput>)self.coordinator switchedToEditingMode:selectedEditingControl.mode];
		}
		else{
			dispatch_async(dispatch_get_main_queue(), ^{
				[(id<DEMOEditControlUsecaseOutput>)self.coordinator switchedToEditingMode:selectedEditingControl.mode];
			});
		}
	}
}

@end

