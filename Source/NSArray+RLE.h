@import Foundation;


@interface NSArray (RLE)

- (NSSet *)set;
- (NSIndexPath *)indexPath;

@end


static inline NSArray *unwrapArray(NSArray *array) { return array ?: @[]; }
