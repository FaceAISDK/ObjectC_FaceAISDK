//
//  ViewController.m
//  ObjectC_FaceAISDK
//
//  Created by anylife on 2025/11/11.
//

#import "ViewController.h"
// Exposes the Swift bridge methods to Objective-C.
// 向 Objective-C 暴露 Swift 桥接方法。
#import "ObjectC_FaceAISDK-Swift.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Configure the Objective-C demo navigation page.
    // 配置 Objective-C 示例功能导航页面。
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    self.title = @"FaceAISDK ObjC Demo";

    // Keep the first seven titles and their order aligned with FaceAINaviView.
    // 前七个标题及其顺序需与 FaceAINaviView 保持一致。
    NSArray *titles = @[
        NSLocalizedString(@"Enroll Face By Camera", nil),
        NSLocalizedString(@"Enroll Face From Album", nil),
        NSLocalizedString(@"Face Verify & Liveness", nil),
        NSLocalizedString(@"Liveness Detection Only", nil),
        NSLocalizedString(@"Is Face Feature Exist", nil),
        NSLocalizedString(@"Compare Two Faces", nil),
        NSLocalizedString(@"About us", nil),
        @"→ FaceAISDK Swift Demo"
    ];

    // Build the menu with a tag that maps to the corresponding bridge action below.
    // 使用 tag 构建菜单，并映射到下方对应的桥接操作。
    CGFloat y = 120;
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(30, y, self.view.bounds.size.width - 60, 48);
        btn.tag = i;
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
        btn.backgroundColor = (i == 7) ? [UIColor systemOrangeColor] : [UIColor systemBlueColor];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 12;
        [btn addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        y += 60;
    }
}

- (void)menuTapped:(UIButton *)sender {
    // Create the selected SwiftUI feature through FaceAISDKBridge.
    // 通过 FaceAISDKBridge 创建选中的 SwiftUI 功能页面。
    UIViewController *vc = nil;
    switch (sender.tag) {
        case 0:
            vc = [FaceAISDKBridge addFaceByCameraViewController];
            break;
        case 1:
            vc = [FaceAISDKBridge addFaceByImageViewController];
            break;
        case 2:
            vc = [FaceAISDKBridge verifyFaceViewController];
            break;
        case 3:
            vc = [FaceAISDKBridge livenessDetectViewController];
            break;
        case 4: {
            // Face features are stored by faceID after a successful enrollment.
            // 人脸录入成功后，特征值会按 faceID 保存。
            NSString *feature = [FaceAISDKBridge isFaceFeatureExist];
            NSString *msg = feature ? [NSString stringWithFormat:@"Feature: %@", feature] : @"No face feature found!";
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Face Feature" message:msg preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
            return;
        }
        case 5:
            vc = [FaceAISDKBridge verifyTwoFaceSimiViewController];
            break;
        case 6: {
            // Open the FaceAISDK website outside the demo.
            // 在示例应用外打开 FaceAISDK 网站。
            NSURL *url = [NSURL URLWithString:@"https://faceaisdk.github.io/index"];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
            return;
        }
        case 7:
            vc = [FaceAISDKBridge faceAINaviViewController];
            break;
        default:
            return;
    }

    // Present every bridged feature as a full-screen flow.
    // 所有桥接功能均以全屏流程展示。
    if (vc) {
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
