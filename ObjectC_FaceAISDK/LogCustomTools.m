#import "LogCustomTools.h"

@implementation LogCustomTools

- (void)printInstanceLog:(NSString *)message {
    // Print the received Swift message with the instance-method prefix.
    // 使用实例方法前缀打印从 Swift 接收的消息。
    NSLog(@"[ObjC 实例方法] 收到来自 Swift 的消息: %@", message);
}

+ (void)printClassLog:(NSString *)message {
    // Print the received Swift message with the class-method prefix.
    // 使用类方法前缀打印从 Swift 接收的消息。
    NSLog(@"[ObjC 类方法] 收到来自 Swift 的消息: %@", message);
}

@end
