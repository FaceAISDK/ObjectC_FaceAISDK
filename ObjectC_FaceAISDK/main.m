//
//  main.m
//  ObjectC_FaceAISDK
//
//  Created by anylife on 2025/11/11.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Resolve the application delegate class inside the autorelease pool.
        // 在自动释放池中获取应用代理类。
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
