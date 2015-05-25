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

- (NSSortDescriptor *)ascending;
- (NSSortDescriptor *)descending;

- (NSDate *(^)(NSString *format))dateUsingFormat;

- (BOOL (^)(NSString *rx))grep;

@end
