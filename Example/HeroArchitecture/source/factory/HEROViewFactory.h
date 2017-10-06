//
//  FMViewGenerator.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;


@interface HEROViewFactory : NSObject

+(UIImageView*)imageViewWithImage:(UIImage*)image;
+(UIImageView*)imageViewWithImageNamed:(NSString*)imageName;
+(UILabel*)labelWithText:(NSString *)text;
+(UIButton*)buttonWithTitle:(NSString*)title target:(id)target selector:(SEL)selector;

#pragma mark - UICollectionView
+ (UICollectionView *)collectionView;
+ (UICollectionView*)collectionViewWithLayout:(UICollectionViewLayout*)layout;
+ (UICollectionViewFlowLayout*)collectionViewFlowLayout;
@end
