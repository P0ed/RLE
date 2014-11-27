//
//  NSString+RLE.h
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


@import Foundation;
@import UIKit;


@interface NSString (RLE)

@property (nonatomic, readonly) NSURL *URL;
@property (nonatomic, readonly) NSUInteger hexValue;
@property (nonatomic, readonly) NSString *localized;
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSRange wholeString;

@property (nonatomic, readonly) NSAttributedString *attributedString;
@property (nonatomic, readonly) NSMutableAttributedString *mutableAttributedString;

@property (nonatomic, readonly) NSPredicate *predicate;
@property (nonatomic, readonly) NSSortDescriptor *ascending;
@property (nonatomic, readonly) NSSortDescriptor *descending;

@property (nonatomic, readonly) NSDate *(^dateUsingFormat)(NSString *format);

@property (nonatomic, readonly) BOOL (^grep)(NSString *rx);

@end
