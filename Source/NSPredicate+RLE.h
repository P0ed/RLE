@import Foundation;


@interface NSPredicate (RLE)
- (NSPredicate *)notPredicate;
@end


@interface NSString (RLENSPredicate)
- (NSPredicate *)predicate;
@end


@interface NSDictionary (RLENSPredicate)
- (NSPredicate *)predicate;
@end


@interface NSArray (RLENSPredicate)
- (NSPredicate *)andPredicate;
- (NSPredicate *)orPredicate;
@end
