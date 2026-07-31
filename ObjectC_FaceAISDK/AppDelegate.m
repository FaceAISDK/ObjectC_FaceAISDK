//
//  AppDelegate.m
//  ObjectC_FaceAISDK
//
//  Created by anylife on 2025/11/11.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Perform application-wide setup after launch.
    // 应用启动后执行全局初始化。
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Provide the default configuration for a newly connected scene.
    // 为新连接的场景提供默认配置。
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Release resources associated with discarded scene sessions when needed.
    // 如有需要，释放已丢弃场景会话关联的资源。
}


@end
