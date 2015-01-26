//
//  NSMutableAttributedString+RLE.h
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


@import Foundation;
@import UIKit;


@interface NSMutableAttributedString (RLE)

@property (nonatomic, assign) UIFont *font;
@property (nonatomic, assign) UIColor *textColor;
@property (nonatomic, assign) UIColor *backgroundColor;
@property (nonatomic, assign) NSParagraphStyle *paragraphStyle;
@property (nonatomic, assign) NSTextAlignment alignment;

@end


@interface NSAttributedString (RLE_readonly)

@property (nonatomic, readonly) UIFont *font;
@property (nonatomic, readonly) UIColor *textColor;
@property (nonatomic, readonly) UIColor *backgroundColor;
@property (nonatomic, readonly) NSParagraphStyle *paragraphStyle;
@property (nonatomic, readonly) NSTextAlignment alignment;

@end
