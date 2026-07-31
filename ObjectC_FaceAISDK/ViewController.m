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
@property (nonatomic, strong, nullable) UIView *resultToastView;
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

// Show a result toast using the same success/failure colors as FaceAINaviView.
// 使用与 FaceAINaviView 一致的成功/失败颜色显示结果 Toast。
- (void)showResultToastWithMessage:(NSString *)message success:(BOOL)success {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.resultToastView.layer removeAllAnimations];
        [self.resultToastView removeFromSuperview];

        UIView *toastView = [[UIView alloc] init];
        toastView.translatesAutoresizingMaskIntoConstraints = NO;
        toastView.backgroundColor = success
            ? ([UIColor colorNamed:@"FaceMainColor"] ?: [UIColor systemGreenColor])
            : [UIColor systemRedColor];
        toastView.layer.cornerRadius = 25.0;
        toastView.layer.shadowColor = [UIColor blackColor].CGColor;
        toastView.layer.shadowOpacity = 0.2;
        toastView.layer.shadowRadius = 5.0;
        toastView.layer.shadowOffset = CGSizeMake(0, 2);
        toastView.alpha = 0.0;

        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        messageLabel.text = message.length > 0 ? message : (success ? @"Success" : @"Failed");
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.font = [UIFont boldSystemFontOfSize:19.0];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.numberOfLines = 0;

        [toastView addSubview:messageLabel];
        [self.view addSubview:toastView];
        [NSLayoutConstraint activateConstraints:@[
            [messageLabel.topAnchor constraintEqualToAnchor:toastView.topAnchor constant:14.0],
            [messageLabel.leadingAnchor constraintEqualToAnchor:toastView.leadingAnchor constant:22.0],
            [messageLabel.trailingAnchor constraintEqualToAnchor:toastView.trailingAnchor constant:-22.0],
            [messageLabel.bottomAnchor constraintEqualToAnchor:toastView.bottomAnchor constant:-14.0],
            [toastView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
            [toastView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-24.0],
            [toastView.widthAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor multiplier:0.9]
        ]];

        self.resultToastView = toastView;
        [UIView animateWithDuration:0.25 animations:^{
            toastView.alpha = 1.0;
        }];

        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)),
            dispatch_get_main_queue(),
            ^{
                if (self.resultToastView != toastView) {
                    return;
                }
                [UIView animateWithDuration:0.25
                    animations:^{
                        toastView.alpha = 0.0;
                    }
                    completion:^(BOOL finished) {
                        [toastView removeFromSuperview];
                        if (self.resultToastView == toastView) {
                            self.resultToastView = nil;
                        }
                    }];
            }
        );
    });
}

// Wait for the presented feature page to dismiss before revealing its result.
// 等待功能页面关闭后再显示返回结果。
- (void)showFlowResultToastWithMessage:(NSString *)message success:(BOOL)success {
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)),
        dispatch_get_main_queue(),
        ^{
            [self showResultToastWithMessage:message success:success];
        }
    );
}

- (void)menuTapped:(UIButton *)sender {
    // Create the selected SwiftUI feature through FaceAISDKBridge.
    // 通过 FaceAISDKBridge 创建选中的 SwiftUI 功能页面。
    UIViewController *vc = nil;
    __weak typeof(self) weakSelf = self;
    switch (sender.tag) {
        case 0: {
            vc = [FaceAISDKBridge addFaceByCameraViewControllerWithResultHandler:^(BOOL success, NSString *message) {
                [weakSelf showFlowResultToastWithMessage:message success:success];
            }];
            break;
        }
        case 1: {
            vc = [FaceAISDKBridge addFaceByImageViewControllerWithResultHandler:^(BOOL success, NSString *message) {
                [weakSelf showFlowResultToastWithMessage:message success:success];
            }];
            break;
        }
        case 2: {
            vc = [FaceAISDKBridge verifyFaceViewControllerWithResultHandler:^(BOOL success, NSString *message) {
                [weakSelf showFlowResultToastWithMessage:message success:success];
            }];
            break;
        }
        case 3: {
            vc = [FaceAISDKBridge livenessDetectViewControllerWithResultHandler:^(BOOL success, NSString *message) {
                [weakSelf showFlowResultToastWithMessage:message success:success];
            }];
            break;
        }
        case 4: {
            // Face features are stored by faceID after a successful enrollment.
            // 人脸录入成功后，特征值会按 faceID 保存。
            NSString *feature = [FaceAISDKBridge isFaceFeatureExist];
            NSString *message = feature ? @"Face feature exists." : @"No face feature found!";
            [self showResultToastWithMessage:message success:(feature != nil)];
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
