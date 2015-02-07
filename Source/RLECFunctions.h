//
//  RLECFunctions.h
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 16/08/14.
//
//


#define SELString(SELECTOR) \
NSStringFromSelector(@selector(SELECTOR))


#define ResignFirstResponder() \
[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil]


#pragma mark - NSUserDefaults
@import Foundation.NSUserDefaults;

static inline void NSUserDefaultsSync(void(^block)(NSUserDefaults const * const defaults)) {

	NSUserDefaults const * const defaults = [NSUserDefaults standardUserDefaults];
	block(defaults);
	[defaults synchronize];
}
