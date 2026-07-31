//
//  SceneDelegate.m
//  ObjectC_FaceAISDK
//
//  Created by anylife on 2025/11/11.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // The storyboard creates and attaches the window to this scene automatically.
    // Storyboard 会自动创建窗口并将其关联到当前场景。
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Release scene resources that can be recreated after a disconnection.
    // 场景断开连接后，释放可重新创建的场景资源。
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Resume tasks paused while the scene was inactive when needed.
    // 如有需要，恢复场景非活跃期间暂停的任务。
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Pause active work before the scene becomes inactive when needed.
    // 如有需要，在场景进入非活跃状态前暂停相关任务。
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Restore state changed while the scene was in the background when needed.
    // 如有需要，恢复场景进入后台时变更的状态。
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Save state and release shared resources after entering the background when needed.
    // 如有需要，在进入后台后保存状态并释放共享资源。
}


@end
