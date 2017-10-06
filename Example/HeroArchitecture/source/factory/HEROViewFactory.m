//
//  FMViewGenerator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROViewFactory.h"
#import "DEMOAppColor.h"
#import "DEMOAppFont.h"

//#define COLOR_BACKGROUND_BUTTON_DISABLED [UIColor purpleColor]

@implementation HEROViewFactory

#pragma mark - UIImageView

+(UIImageView*)imageViewWithImageNamed:(NSString*)imageName{
	return [[self class] imageViewWithImage:[UIImage imageNamed:imageName]];
}

+(UIImageView*)imageViewWithImage:(UIImage*)image{
	UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	return imageView;
}

#pragma mark - UILabel
+(UILabel*)labelWithText:(NSString *)text{
	return [self labelWithText:text textColor:[[DEMOAppColor currentTheme] labelText]  backgroundColor:[[DEMOAppColor currentTheme] labelBackground]];
}

+(UILabel *)labelWithText:(NSString *)text textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor{
	UILabel* label = [UILabel new];
	label.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleBody];
	label.textColor= textColor;
	label.backgroundColor = backgroundColor;
	label.text = text;
	label.numberOfLines = 0;
	return label;
}

#pragma mark - UIButton
+(UIButton*)buttonWithTitle:(NSString*)title target:(id)target selector:(SEL)selector{
	return [self buttonWithTitle:title target:target selector:selector titleColor:[[DEMOAppColor currentTheme] labelText] colorHighlight:[[DEMOAppColor currentTheme] buttonTitleHighlighted] colorDisabled:[[DEMOAppColor currentTheme] buttonTitleDisabled] backgroundColor:[[DEMOAppColor currentTheme] buttonBackground]];
}

+(UIButton*)buttonWithTitle:(NSString*)title target:(id)target selector:(SEL)selector titleColor:(UIColor*)titleColor colorHighlight:(UIColor*)colorHighlight  colorDisabled:(UIColor*)colorDisabled backgroundColor:(UIColor*)backgroundColor{
	UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.titleLabel.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleHeadline];
	[button setTitle:title forState:UIControlStateNormal];
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	[button setTitleColor:titleColor forState:UIControlStateNormal];
	[button setTitleColor:colorHighlight forState:UIControlStateHighlighted];
	[button setTitleColor:colorDisabled forState:UIControlStateDisabled];
	button.backgroundColor = backgroundColor;
	return button;
}

#pragma mark - UITextField
+(UITextField*)textFieldWithText:(NSString*)text{
	UITextField* textField = [UITextField new];
	textField.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleBody];
	textField.text = text;
	return textField;
}

#pragma mark - UITextView
+(UITextView*)textViewWithText:(NSString*)text{
	UITextView* textView = [UITextView new];
	textView.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleBody];
	textView.text = text;
	return textView;
}

#pragma mark - UICollectionView
+ (UICollectionView *)collectionView{
	return [[self class] collectionViewWithLayout:[self collectionViewFlowLayout]];
}

+ (UICollectionView*)collectionViewWithLayout:(UICollectionViewLayout*)layout{
	UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:(CGRectZero) collectionViewLayout:layout];
	collectionView.bounces = YES;
	collectionView.backgroundColor = [UIColor whiteColor];
	return collectionView;
}

+ (UICollectionViewFlowLayout*)collectionViewFlowLayout{
	UICollectionViewFlowLayout *collectionViewLayout = [UICollectionViewFlowLayout new];
	collectionViewLayout.minimumInteritemSpacing = 0.0f;
	collectionViewLayout.minimumLineSpacing = 0.0f;
	return collectionViewLayout;
}


@end
