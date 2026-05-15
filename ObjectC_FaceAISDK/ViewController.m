//
//  ViewController.m
//  ObjectC_FaceAISDK
//
//  Created by anylife on 2025/11/11.
//

#import "ViewController.h"
#import "ObjectC_FaceAISDK-Swift.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    self.title = @"FaceAISDK ObjC Demo";
    
    NSArray *titles = @[
        NSLocalizedString(@"Add Face By Camera", nil),
        NSLocalizedString(@"Add Face From Album", nil),
        NSLocalizedString(@"Face Verify & Liveness", nil),
        NSLocalizedString(@"ONLY Liveness Detection", nil),
        NSLocalizedString(@"Is Face Feature Exist", nil),
        NSLocalizedString(@"Verify Two Face Similarity", nil),
        NSLocalizedString(@"About us", nil),
        @"→ FaceAISDK Swift Demo"
    ];
    
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
    if (vc) {
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
