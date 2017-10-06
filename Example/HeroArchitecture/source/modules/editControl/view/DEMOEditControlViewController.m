//
//  DEMOEditControlViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEditControlViewController.h"
#import "DEMOEditControlView.h"
#import "DEMOEditingControlCollectionViewCell.h"
#import "DEMOConstants.h"

@interface DEMOEditControlViewController () <DEMOEditControlViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) DEMOEditControlView* viewEditControl;
@end

@implementation DEMOEditControlViewController

- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	
	return self;
}


- (void)loadView{
    self.viewEditControl = [DEMOEditControlView new];
    self.view = self.viewEditControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewEditControl.delegate = self;
	[self.viewEditControl collectionView].dataSource = self;
	[self.viewEditControl collectionView].delegate = self;
	[[self.viewEditControl collectionView] registerClass:[DEMOEditingControlCollectionViewCell class] forCellWithReuseIdentifier:CELL_EDITING_CONTROL];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
	return [(id<DEMOEditControlViewOutput>)self.coordinator numberOfSections];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return [(id<DEMOEditControlViewOutput>)self.coordinator numberOfItemsInSection:section];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	DEMOEditingPonso* editingControl = [(id<DEMOEditControlViewOutput>)self.coordinator editingItemForIndex:indexPath.item];
	DEMOEditingControlCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_EDITING_CONTROL forIndexPath:indexPath];
	[cell updateEditingControl:editingControl];
	return cell;
}

#pragma mark - UICollectionViewDelegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
	BOOL isHorizontallyWider = collectionView.bounds.size.height < collectionView.bounds.size.width;
	if (isHorizontallyWider) {
		float itemDimension = collectionView.bounds.size.height - (LAYOUT_BORDER_DEFAULT*2);
		return (CGSize){itemDimension,itemDimension};
	}
	else{
		return (CGSize){collectionView.bounds.size.width - (LAYOUT_BORDER_DEFAULT*2),60.0f};
	}
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
	[(id<DEMOEditControlViewOutput>)self.coordinator selectedEditingItemAtIndex:indexPath.item];
}

#pragma mark - DEMOEditControlViewInput

-(void)requestViewUpdate{
	[[self.viewEditControl collectionView] reloadData];
}

#pragma mark - DEMOEditControlViewDelegate

#pragma mark - Public

@end
