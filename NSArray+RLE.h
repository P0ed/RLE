//
//  NSArray+RLE.h
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


@import Foundation;


typedef NSArray *(^RLEMapFunction)(id(^)(id));
typedef NSArray *(^RLEFilterFunction)(BOOL(^)(id));


extern RLEMapFunction tmap(NSArray *);
extern RLEFilterFunction tfilter(NSArray *);


@interface NSArray (RLE)

- (NSSet *)set;
- (NSIndexPath *)indexPath;

- (RLEMapFunction)map;
- (RLEFilterFunction)filter;

@end
