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

#pragma mark - UIImageView
+(UIImageView*)imageViewWithImage:(UIImage*)image;
+(UIImageView*)imageViewWithImageNamed:(NSString*)imageName;

#pragma mark - UILabel
+(UILabel*)labelWithText:(NSString *)text;
+(UILabel *)labelWithText:(NSString *)text textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor;

#pragma mark - UIButton
+(UIButton*)buttonWithTitle:(NSString*)title target:(id)target selector:(SEL)selector;
+(UIButton*)buttonWithTitle:(NSString*)title target:(id)target selector:(SEL)selector titleColor:(UIColor*)titleColor colorHighlight:(UIColor*)colorHighlight  colorDisabled:(UIColor*)colorDisabled backgroundColor:(UIColor*)backgroundColor;

#pragma mark - UITextField
+(UITextField*)textFieldWithText:(NSString*)text;

#pragma mark - UITextView
+(UITextView*)textViewWithText:(NSString*)text;

#pragma mark - UICollectionView
+ (UICollectionView *)collectionView;
+ (UICollectionView*)collectionViewWithLayout:(UICollectionViewLayout*)layout;
+ (UICollectionViewFlowLayout*)collectionViewFlowLayout;
@end
