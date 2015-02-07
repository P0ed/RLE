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

- (NSURL *)URL;
- (NSNumber *)hexValue;
- (NSString *)localized;
- (UIImage *)image;
- (NSRange)wholeString;

- (NSAttributedString *)attributedString;
- (NSMutableAttributedString *)mutableAttributedString;

- (NSPredicate *)predicate;
- (NSSortDescriptor *)ascending;
- (NSSortDescriptor *)descending;

- (NSDate *(^)(NSString *format))dateUsingFormat;

- (BOOL (^)(NSString *rx))grep;

@end
