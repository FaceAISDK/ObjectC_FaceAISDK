#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LogCustomTools : NSObject

/// Prints a message through an instance method.
/// 通过实例方法打印消息。
- (void)printInstanceLog:(NSString *)message;

/// Prints a message directly through the class method.
/// 直接通过类方法打印消息。
+ (void)printClassLog:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
