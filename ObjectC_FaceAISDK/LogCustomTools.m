#import "LogCustomTools.h"

@implementation LogCustomTools

- (void)printInstanceLog:(NSString *)message {
    // 使用 NSLog 打印日志
    NSLog(@"[ObjC 实例方法] 收到来自 Swift 的消息: %@", message);
}

+ (void)printClassLog:(NSString *)message {
    // 使用 NSLog 打印日志
    NSLog(@"[ObjC 类方法] 收到来自 Swift 的消息: %@", message);
}

@end
