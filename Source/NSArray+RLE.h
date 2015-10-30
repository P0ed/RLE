@import Foundation;


@interface NSArray (RLE)

- (NSArray *)tail;

- (NSSet *)set;
- (NSOrderedSet *)orderedSet;

- (NSIndexPath *)indexPath;
- (NSString *)keyPath;

@end


static inline NSArray *unwrapArray(NSArray *array) { return array ?: @[]; }
