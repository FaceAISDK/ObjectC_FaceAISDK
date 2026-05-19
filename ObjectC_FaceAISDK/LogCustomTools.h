#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LogCustomTools : NSObject

// 1. 实例方法（需要 new 一个对象才能调用）
- (void)printInstanceLog:(NSString *)message;

// 2. 类方法 / 静态方法（可以直接用类名调用，更方便）
+ (void)printClassLog:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
