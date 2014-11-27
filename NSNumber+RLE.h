//
//  NSNumber+RLE.h
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


@import Foundation;
@import UIKit;


@interface NSNumber (RLE)

@property (nonatomic, readonly) UIFont *ptFont;
@property (nonatomic, readonly) UIFont *ptMediumFont;
@property (nonatomic, readonly) UIFont *ptLightFont;

@property (nonatomic, readonly) UIColor *rgbColor;
@property (nonatomic, readonly) UIColor *rgbaColor;

@property (nonatomic, readonly) NSNumber *(^ifTrue)(void (^block)(void));
@property (nonatomic, readonly) NSNumber *(^ifFalse)(void (^block)(void));

@end
