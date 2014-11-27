Literal convertibles for common obj-c types
-------------------------------------------

Usage:
======

```Objective-C
NSMutableAttributedString *string = @"Featured".localized.mutableAttributedString;
string.textColor = @(0xCC7722).rgbColor;
string.font = @(14).ptFont;
string.alignment = NSTextAlignmentCenter;

NSString *format = @"MM/dd/yyyy";
NSDate *date = @"11/27/2014".dateUsingFormat(format);
NSString *formattedDate = date.stringUsingFormat(format);

UIImage *img = @"bg_label".image;
NSURL *URL = @"https://github.com/P0ed/RLE".URL;

NSArray *array;
NSPredicate *predicate = @[@"synced = YES".predicate, @"upcoming = YES".predicate].orPredicate;
array = [array filteredArrayUsingPredicate:predicate];
array = [array sortedArrayUsingDescriptors:@[@"date".ascending]];

NSNumber *value;
value.ifTrue(^{
	
}).ifFalse(^{
	
});
```
